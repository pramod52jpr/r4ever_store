import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:intl/intl.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/global_data_model/global_data_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';
import 'package:r4everstore/widgets/upload_image.dart';

class VipQrScreen extends StatefulWidget {
  final String planName;
  final int amount;
  const VipQrScreen({super.key, required this.planName, required this.amount});

  @override
  State<VipQrScreen> createState() => _VipQrScreenState();
}

class _VipQrScreenState extends State<VipQrScreen> {
  GlobalData? data;
  ApiStatus status = ApiStatus.initial;
  String message = '';

  TextRecognizer textRecognizer = TextRecognizer();
  File? selectedImage;
  bool loadingPayment = false;

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

  void makePayment() async{
    var res = await ApiServices().postRequest('plan/add_purchase_plan', data: {
      "planName": widget.planName,
      "amount": widget.amount,
      "purchaseDate": "${DateTime.now()}",
      "expiry": "${DateTime.now().add(const Duration(days: 180))}",
      "image": await MultipartFile.fromFile(selectedImage!.path, filename: selectedImage!.path.split('/').last),
      "status": false,
    }, withFile: true);
    ActionStatusModel resp = ActionStatusModel.fromJson(res);
    if(resp.status){
      Navigator.pop(context);
      Utils.showFlushBar(resp.message, FlushBarType.success, context);
    }else{
      Utils.showFlushBar(resp.message, FlushBarType.error, context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: status == ApiStatus.loading
          ? const LoadingWidget()
          : status == ApiStatus.error
          ? CustomErrorWidget(message: message)
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Center(child: Image.asset("assets/images/client_qr.jpeg")),
                Center(child: data == null || data!.qrCode.isEmpty ? const SizedBox(
                  height: 200,
                    child: Center(child: Text('Qr not available')),
                ) : Image.network(data!.qrCode)),
                const SizedBox(height: 10),
                Center(child: Text("₹ ${widget.amount}/-", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                const Text("How to pay?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text("1. Scan this qr code by phone pe, google pay etc."),
                const Text("2. Make the payment of given amount"),
                const Text("1. Capture the success payment screenshot"),
                const Text("1. upload the screenshot below and Make payment request"),
                const Text("OR", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Text("Direct send in bank account and upload screenshot", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("Bank name: IDFC FIRST BANK\nAcc. No.: 89440027962\nIfsc Code: IDFB0080395\nAccount Holder Name: R FOR DIGITAL MARKETING"),
                const SizedBox(height: 20),
                UploadImage(
                  imageFile: selectedImage,
                  onTap: () async{
                    File? pickedFile = await Utils.pickImage();
                    if(pickedFile!= null){
                      selectedImage = pickedFile;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(height: 20),
                AppButton(
                  title: "Make Payment Request",
                  loading: loadingPayment,
                  onTap: () async{
                    try{
                      loadingPayment = true;
                      setState(() {});
                      if(selectedImage == null){
                        Utils.showFlushBar("Please select the image first", FlushBarType.error, context);
                        return;
                      }
                      RecognizedText recognizedText = await textRecognizer.processImage(InputImage.fromFile(selectedImage!));
                      String line = '';
                      for(TextBlock textBlock in recognizedText.blocks){
                        for(TextLine textLine in textBlock.lines){
                          line+=textLine.text;
                        }
                      }
                      if(line.contains('${widget.amount}') || line.contains(NumberFormat().format(widget.amount))){
                        makePayment();
                      }else{
                        Utils.showFlushBar("Invalid amount", FlushBarType.error, context);
                      }
                    }catch(e){
                      debugPrint(e.toString());
                    }finally{
                      loadingPayment = false;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
