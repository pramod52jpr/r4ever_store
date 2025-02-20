import 'package:flutter/material.dart';
import 'package:r4everstore/data/model/global_data_model/global_data_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
      appBar: AppBar(
        title: const Text("Terms & Conditions", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: status == ApiStatus.loading
          ? const LoadingWidget()
          : status == ApiStatus.error
          ? CustomErrorWidget(message: message)
          : SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(data!.termsConditions, style: const TextStyle(fontSize: 18, height: 2)),
              ),
          ),
    );
  }
}
