import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/membership_bloc/membership_bloc.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/data/model/global_data_model/global_data_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/data/repository/membership_repo.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/services/session.dart';
import 'package:r4everstore/ui/home/vip_qr_screen.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/header_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:uuid/uuid.dart';

class VipScreen extends StatefulWidget {
  const VipScreen({super.key});

  @override
  State<VipScreen> createState() => _VipScreenState();
}

class _VipScreenState extends State<VipScreen> {
  late MembershipBloc membershipBloc;
  final Razorpay _razorpay = Razorpay();
  late ProfileBloc profileBloc;


  GlobalData? globalData;
  ApiStatus status = ApiStatus.initial;
  String message = '';

  void fetchGlobalData({bool firstLoad = true}) async {
    try {
      if(firstLoad){
        status = ApiStatus.loading;
        setState(() {});
      }
      var res = await ApiServices().getRequest("plan/get_payment_qr"); // it is giving global data
      var resp = GlobalDataModel.fromJson(res);
      if (resp.status) {
        globalData = resp.data;
        message = resp.message;
        status = ApiStatus.success;
        setState(() {});
      } else {
        status = ApiStatus.error;
        message = resp.message;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
      status = ApiStatus.error;
      message = e.toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchGlobalData();
    membershipBloc = MembershipBloc(membershipRepo: MembershipRepo());
    profileBloc = ProfileBloc(profileRepo: ProfileRepo());
    profileBloc.add(FetchProfileData());
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentErrorResponse);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccessResponse);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  void paymentErrorResponse(PaymentFailureResponse response) {
    Utils.showFlushBar(response.message!, FlushBarType.error, context);
  }

  void paymentSuccessResponse(PaymentSuccessResponse response) {
    membershipBloc.add(PurchasePlan());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    Utils.showFlushBar("External wallet selected ${response.walletName}", FlushBarType.warn, context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: status == ApiStatus.loading
          ? const LoadingWidget()
          : status == ApiStatus.error
          ? CustomErrorWidget(message: message)
          : SafeArea(
        child: BlocProvider(
          create: (context) => membershipBloc,
          child: BlocProvider(
            create: (context) => profileBloc,
            child: BlocListener<MembershipBloc, MembershipState>(
              listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
              listener: (context, state) {
                if(state.actionApiStatus == ApiStatus.error){
                  Utils.showFlushBar(state.message, FlushBarType.error, context);
                }
                if(state.actionApiStatus == ApiStatus.success){
                  Utils.showFlushBar(state.message, FlushBarType.success, context);
                }
              },
              child: BlocBuilder<ProfileBloc, ProfileState>(
                buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
                builder: (context, profileBlocState) {
                  if (profileBlocState.fetchDataApiStatus == ApiStatus.loading ||
                      profileBlocState.fetchDataApiStatus == ApiStatus.initial) {
                    return const LoadingWidget();
                  }
                  if (profileBlocState.fetchDataApiStatus == ApiStatus.error) {
                    return CustomErrorWidget(message: profileBlocState.error);
                  }
                  return SingleChildScrollView(
                    child: BlocBuilder<MembershipBloc, MembershipState>(
                      builder: (context, membershipBlocState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // const HeaderWidget(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text("VIP Membership", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23)),
                                  const SizedBox(height: 10),
                                  ListView(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemExtent: 150,
                                    children: [
                                      VipWidget(
                                        title: "Silver Plan",
                                        subtitle: "INR 2000/- + 360/- (18% GST)\nTotal: 2360/-",
                                        trailing: "",
                                        lock: globalData != null && globalData!.silverLock,
                                        color1: const Color(0xff92daff),
                                        color2: const Color(0xffC0C0C0),
                                        purchased: Session.plan == 'silver',
                                        onTap: () async{
                                          if (Session.plan.isEmpty) {
                                            membershipBloc.add(const ChangePlanDetails(planName: "silver", amount: 2360));
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VipQrScreen(planName: 'silver', amount: 2360)));
                                            // var options = {
                                            //   'key': PayDetail.merchantKey,
                                            //   'amount': 2360 * 100,
                                            //   'name': "R4EVER STORE",
                                            //   'description': 'Recharge Wallet',
                                            //   'retry': {'enabled': true, 'max_count': 1},
                                            //   'send_sms_hash': true,
                                            //   'prefill': {'contact': profileBlocState.userData!.phone},
                                            //   // 'external': {
                                            //   //   'wallets': ['paytm']
                                            //   // }
                                            // };
                                            // _razorpay.open(options);
                                          }
                                        },
                                      ),
                                      VipWidget(
                                        title: "Gold Plan",
                                        subtitle: "INR 7000/- + 1260/- (18% GST)\nTotal: 8260/-",
                                        trailing: "",
                                        color1: const Color(0xffad7600),
                                        color2: const Color(0xffFFD700),
                                        purchased: Session.plan == 'gold',
                                        lock: globalData != null && globalData!.goldLock,
                                        onTap: () {
                                          if (Session.plan.isEmpty || Session.plan == 'silver') {
                                            membershipBloc.add(const ChangePlanDetails(planName: "gold", amount: 8260));
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VipQrScreen(planName: 'gold', amount: 8260)));
                                            // var options = {
                                            //   'key': PayDetail.merchantKey,
                                            //   'amount': 8260 * 100,
                                            //   'name': "R4EVER STORE",
                                            //   'description': 'Recharge Wallet',
                                            //   'retry': {'enabled': true, 'max_count': 1},
                                            //   'send_sms_hash': true,
                                            //   'prefill': {'contact': profileBlocState.userData!.phone},
                                            //   // 'external': {
                                            //   //   'wallets': ['paytm']
                                            //   // }
                                            // };
                                            // _razorpay.open(options);
                                          }
                                        },
                                      ),
                                      VipWidget(
                                        title: "Platinum Plan",
                                        subtitle: "INR 20000/- + 3600/- (18% GST)\nTotal: 23600/-",
                                        trailing: "",
                                        color1: const Color(0xffff3302),
                                        color2: const Color(0xffff7d8c),
                                        purchased: Session.plan == 'platinum',
                                        lock: globalData != null && globalData!.platinumLock,
                                        onTap: () {
                                          if (Session.plan.isEmpty || Session.plan == 'silver' || Session.plan == 'gold') {
                                            membershipBloc.add(const ChangePlanDetails(planName: "platinum", amount: 23600));
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VipQrScreen(planName: 'platinum', amount: 23600)));
                                            // var options = {
                                            //   'key': PayDetail.merchantKey,
                                            //   'amount': 23600 * 100,
                                            //   'name': "R4EVER STORE",
                                            //   'description': 'Recharge Wallet',
                                            //   'retry': {'enabled': true, 'max_count': 1},
                                            //   'send_sms_hash': true,
                                            //   'prefill': {'contact': profileBlocState.userData!.phone},
                                            //   // 'external': {
                                            //   //   'wallets': ['paytm']
                                            //   // }
                                            // };
                                            // _razorpay.open(options);
                                          }
                                        },
                                      ),
                                      VipWidget(
                                        title: "Diamond Plan",
                                        subtitle: "INR 40000/- + 7200/- (18% GST)\nTotal: 47200/-",
                                        trailing: "",
                                        color1: const Color(0xff45ff6d),
                                        color2: const Color(0xffa2fab5),
                                        purchased: Session.plan == 'diamond',
                                        lock: globalData != null && globalData!.diamondLock,
                                        onTap: () {
                                          if (Session.plan.isEmpty || Session.plan == 'silver' || Session.plan == 'gold' || Session.plan == 'platinum') {
                                            membershipBloc.add(const ChangePlanDetails(planName: "diamond", amount: 47200));
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const VipQrScreen(planName: 'diamond', amount: 47200)));
                                            // var options = {
                                            //   'key': PayDetail.merchantKey,
                                            //   'amount': 47200 * 100,
                                            //   'name': "R4EVER STORE",
                                            //   'description': 'Recharge Wallet',
                                            //   'retry': {'enabled': true, 'max_count': 1},
                                            //   'send_sms_hash': true,
                                            //   'prefill': {'contact': profileBlocState.userData!.phone},
                                            //   // 'external': {
                                            //   //   'wallets': ['paytm']
                                            //   // }
                                            // };
                                            // _razorpay.open(options);
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VipWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;
  final Color color1;
  final Color color2;
  final VoidCallback onTap;
  final bool lock;
  final bool purchased;

  const VipWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.color1,
    required this.color2,
    required this.onTap,
    this.lock = false,
    this.purchased = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: lock ? () {
        Utils.showFlushBar("Coming soon", FlushBarType.warn, context);
      } : onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(title, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 10),
                Text(subtitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if(purchased)
                  const Icon(Icons.check_circle, color: Colors.white),
                if(lock)
                  const Icon(Icons.lock, color: Colors.white),
                Image.asset(Images.crown, height: 80),
                // Text(trailing, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white), textAlign: TextAlign.right)
              ],
            )
          ],
        ),
      ),
    );
  }
}
