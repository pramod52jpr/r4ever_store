import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/global_data_model/global_data_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';
import 'package:r4everstore/widgets/upload_image.dart';

class UploadQr extends StatefulWidget {
  const UploadQr({super.key});

  @override
  State<UploadQr> createState() => _UploadQrState();
}

class _UploadQrState extends State<UploadQr> {
  GlobalData? data;
  ApiStatus status = ApiStatus.initial;
  String message = '';

  ApiStatus deleteStatus = ApiStatus.initial;

  File? qrImage;
  bool uploadLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchQrImage();
  }

  void fetchQrImage() async{
    try{
      status = ApiStatus.loading;
      setState(() {});
      var res = await ApiServices().getRequest("plan/get_payment_qr");
      var resp = GlobalDataModel.fromJson(res);
      if(resp.status){
        data = resp.data;
        message = resp.message;
        status = ApiStatus.success;
        setState(() {});
      }else{
        status = ApiStatus.error;
        message = resp.message;
        setState(() {});
      }
    }catch(e){
      debugPrint(e.toString());
      status = ApiStatus.error;
      message = e.toString();
      setState(() {});
    }
  }

  void uploadQr() async{
    try{
      if(qrImage == null){
        Utils.showFlushBar("Upload an qr code image", FlushBarType.warn, context);
        return;
      }
      setState(() {
        uploadLoading = true;
      });
      var res = await ApiServices().postRequest(
          "plan/upload_qr_code",
          data: {
            "file": await MultipartFile.fromFile(qrImage!.path, filename: qrImage!.path.split('/').last)
          },
          withFile: true,
      );
      ActionStatusModel finalRes = ActionStatusModel.fromJson(res);
      if(finalRes.status){
        fetchQrImage();
        Utils.showFlushBar(finalRes.message, FlushBarType.success, context);
      }else{
        Utils.showFlushBar(finalRes.message, FlushBarType.error, context);
      }
    }catch(e, s){
      Utils.showFlushBar(e.toString(), FlushBarType.error, context);
    }finally{
      setState(() {
        uploadLoading = false;
      });
    }
  }

  deleteQr() async{
    try{
      deleteStatus = ApiStatus.loading;
      setState(() {});
      var res = await ApiServices().postRequest("plan/delete_qr_code");
      ActionStatusModel resp = ActionStatusModel.fromJson(res);
      if(resp.status){
        Utils.showFlushBar(resp.message, FlushBarType.success, context);
        deleteStatus = ApiStatus.loading;
        setState(() {});
        fetchQrImage();
      }
    }catch(e){
      deleteStatus = ApiStatus.error;
      setState(() {});
      debugPrint(e.toString());
    }finally{
      deleteStatus = ApiStatus.initial;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Qr", style: TextStyle(fontWeight: FontWeight.bold)),
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
            UploadImage(
              imageFile: qrImage ?? (data == null || data!.qrCode.isEmpty ? null : data!.qrCode),
              onTap: () async{
                File? img = await Utils.pickImage();
                if(img != null){
                  qrImage = img;
                  setState(() {});
                }
            },),
            const SizedBox(height: 20),
            AppButton(
              title: "Upload Qr",
              loading: uploadLoading,
              onTap: (){
                uploadQr();
              },
            ),
            const SizedBox(height: 10),
            if(data != null && data!.qrCode.isNotEmpty)
              AppButton(
                title: "Delete Qr Code",
                loading: uploadLoading,
                color: Colors.red,
                color1: Colors.red,
                onTap: (){
                  deleteQr();
                },
              )
          ],
        ),
      ),
    );
  }
}
