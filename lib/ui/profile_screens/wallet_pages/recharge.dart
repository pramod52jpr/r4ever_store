import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  Razorpay razorpay = Razorpay();
  late AuthBloc authBloc;
  late ProfileBloc profileBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = context.read<AuthBloc>();
    profileBloc = ProfileBloc(profileRepo: ProfileRepo());
    profileBloc.add(FetchProfileData());
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  void paymentErrorResponse(PaymentFailureResponse response){
    Utils.showFlushBar(response.message!, FlushBarType.error, context);
  }
  
  void paymentSuccessResponse(PaymentSuccessResponse response){
    authBloc.add(RechargeWallet());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    Utils.showFlushBar("External wallet selected ${response.walletName}", FlushBarType.warn, context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    authBloc.add(const ChangeAmount(amount: ''));
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recharge", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => profileBloc,
        child: SafeArea(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
            builder: (context, profileBlocState) {
              if(profileBlocState.fetchDataApiStatus == ApiStatus.loading || profileBlocState.fetchDataApiStatus == ApiStatus.initial){
                return const LoadingWidget();
              }
              if(profileBlocState.fetchDataApiStatus == ApiStatus.error){
                return CustomErrorWidget(message: profileBlocState.error);
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    AppTextField(
                      title: "Amount",
                      showTitle: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6)
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        authBloc.add(ChangeAmount(amount: value));
                      },
                    ),
                    const SizedBox(height: 25),
                    BlocListener<AuthBloc, AuthState>(
                      listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                      listener: (context, state) {
                        if(state.actionApiStatus == ApiStatus.error){
                          Utils.showFlushBar(state.message, FlushBarType.error, context);
                        }
                        if(state.actionApiStatus == ApiStatus.success){
                          authBloc.add(FetchWalletData());
                          Navigator.pop(context);
                          Utils.showFlushBar(state.message, FlushBarType.success, context);
                        }
                      },
                      child: BlocBuilder<AuthBloc, AuthState>(
                        buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus || previous.amount != current.amount,
                        builder: (context, state) {
                          return AppButton(
                            title: "Recharge",
                            loading: state.actionApiStatus == ApiStatus.loading,
                            onTap: () {
                              var options = {
                                'key': PayDetail.merchantKey,
                                'amount': int.parse(state.amount) * 100,
                                'name': "R4EVER STORE",
                                'description': 'Recharge Wallet',
                                // 'retry': {'enabled': true, 'max_count': 1},
                                // 'send_sms_hash': true,
                                'prefill': {'contact': profileBlocState.userData!.phone},
                                // 'external': {
                                //   'wallets': ['paytm']
                                // }
                              };
                              razorpay.open(options);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
