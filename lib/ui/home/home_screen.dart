import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:r4everstore/data/model/global_data_model/global_data_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/services/session.dart';
import 'package:r4everstore/ui/home_pages/task_on_category.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/header_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalData? data;
  ApiStatus status = ApiStatus.initial;
  String message = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchGlobalData();
  }

  void fetchGlobalData({bool firstLoad = true}) async {
    try {
      if(firstLoad){
        status = ApiStatus.loading;
        setState(() {});
      }
      var res = await ApiServices().getRequest("plan/get_payment_qr"); // it is giving global data
      var resp = GlobalDataModel.fromJson(res);
      if (resp.status) {
        data = resp.data;
        message = resp.message;
        status = ApiStatus.success;
        setState(() {});
      } else {
        status = ApiStatus.error;
        message = resp.message;
        setState(() {});
      }
    } catch (e) {
      // debugPrint(e.toString());
      status = ApiStatus.error;
      message = e.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: status == ApiStatus.loading
            ? LoadingWidget()
            : status == ApiStatus.error
            ? CustomErrorWidget(message: message)
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const HeaderWidget(),
              // Image.asset(Images.banner),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   const Center(child: Text("Task hall", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700))),
                   const SizedBox(height: 10),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text("Referral Income", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                       Text("₹${Session.userData!.referralMoney}", style: TextStyle(fontSize: 17)),
                     ],
                   ),
                   const SizedBox(height: 10),
                   if(data != null && data!.impMsg.isNotEmpty)
                     Container(
                       padding: const EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.circular(5)
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           const Text("Important Message ! ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                           const SizedBox(height: 10),
                           Text(data!.impMsg, style: const TextStyle(color: Colors.white)),
                           const SizedBox(height: 5),
                         ],
                       ),
                     ),
                   const SizedBox(height: 10),
                   ListView(
                     shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                       // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, mainAxisExtent: 70),
                       children: [
                         TaskWidget(
                           image: Images.youtube,
                           label: "YouTube Tasks",
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskOnCategory(category: 'youtube'),));
                           },
                         ),
                         const SizedBox(height: 20),
                         TaskWidget(
                           image: Images.topUpWallet,
                           label: "Business Tasks",
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskOnCategory(category: 'business')));
                           },
                         ),
                         const SizedBox(height: 20),
                         TaskWidget(
                           image: Images.topUpWallet,
                           label: "Local Business Tasks",
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskOnCategory(category: 'localBusiness')));
                           },
                         ),
                         // TaskWidget(
                         //   image: Images.instagram,
                         //   label: "Instagram Like and subscribe",
                         //   onTap: () {
                         //
                         //   },
                         // ),
                         // TaskWidget(
                         //   image: Images.kyc,
                         //   label: "KYC Status \nPending",
                         //   onTap: () {
                         //
                         //   },
                         // ),
                       ],
                   ),
                   const SizedBox(height: 20),
                   Image.asset('assets/images/home_image.jpeg'),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;
  const TaskWidget({super.key, required this.image, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [
            Image.asset(image, height: 40),
            const SizedBox(width: 20),
            Expanded(child: Text(label))
          ],
        ),
      ),
    );
  }
}
