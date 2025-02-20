import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/global_data_model/global_data_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class AdminImpMessage extends StatefulWidget {
  const AdminImpMessage({super.key});

  @override
  State<AdminImpMessage> createState() => _AdminImpMessageState();
}

class _AdminImpMessageState extends State<AdminImpMessage> {
  TextEditingController impMessage = TextEditingController();
  GlobalData? data;
  ApiStatus status = ApiStatus.initial;
  String message = '';

  ApiStatus updateLoading = ApiStatus.initial;

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
        impMessage.text = resp.data!.impMsg;
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

  void changeImpMessage() async{
    try{
      setState(() {
        updateLoading = ApiStatus.loading;
      });
      var res = await ApiServices().postRequest("plan/update_imp_msg", data: {
        "impMsg": impMessage.text,
      });
      ActionStatusModel resp = ActionStatusModel.fromJson(res);
      if(resp.status){
        setState(() {
          updateLoading = ApiStatus.success;
        });
        Navigator.pop(context);
        Utils.showFlushBar(resp.message, FlushBarType.success, context);
      }else{
        throw resp.message;
      }
    }catch(e, s){
      setState(() {
        updateLoading = ApiStatus.error;
      });
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      Utils.showFlushBar(e.toString(), FlushBarType.error, context);
    }finally{
      setState(() {
        updateLoading = ApiStatus.initial;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Important Notification", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: status == ApiStatus.loading
          ? const LoadingWidget()
          : status == ApiStatus.error
          ? CustomErrorWidget(message: message)
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: impMessage,
              title: 'Type Message',
              showTitle: false,
              maxLines: 10,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            AppButton(
              title: 'Update',
              loading: updateLoading == ApiStatus.loading,
              onTap: () {
                changeImpMessage();
              },
            )
          ],
        ),
      ),
    );
  }
}
