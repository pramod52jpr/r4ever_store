import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/widgets/app_button.dart';

class Utils{
  static showFlushBar(String message, FlushBarType flushBarType, BuildContext context){
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.decelerate,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      message: message,
      messageColor: flushBarType == FlushBarType.warn ? Colors.black : Colors.white,
      duration: const Duration(seconds: 2),
      backgroundColor: flushBarType == FlushBarType.success ? Colors.green : flushBarType == FlushBarType.error ? Colors.red : Colors.yellow,
      borderRadius: BorderRadius.circular(10),
      icon: Icon(
        flushBarType == FlushBarType.success
            ? Icons.check_circle
            : flushBarType == FlushBarType.error
            ? Icons.error
            : Icons.warning,
        color: flushBarType == FlushBarType.warn ? Colors.black : Colors.white,
      ),
    ).show(context);
  }

  static showActionDialog({required String title, required String content, required BuildContext context, required VoidCallback onTap}){
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(content),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      title: "Cancel",
                      color: Colors.grey,
                      color1: Colors.grey,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 10),
                    AppButton(
                      title: "Delete",
                      color: Colors.red,
                      color1: Colors.red,
                      onTap: onTap,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<File?> pickImage() async{
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if(int.parse(androidInfo.version.release) <= 10){
      if(!await Permission.storage.isGranted){
        if(await Permission.storage.request() != PermissionStatus.granted){
          pickImage();
        }
      }
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if(result != null){
      return File(result.files.single.path!);
    }
    return null;
  }

  static Future<File?> pickVideo() async{
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if(int.parse(androidInfo.version.release) <= 10){
      if(!await Permission.storage.isGranted){
        if(await Permission.storage.request() != PermissionStatus.granted){
          pickVideo();
        }
      }
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video
    );
    if(result != null){
      return File(result.files.single.path!);
    }
    return null;
  }

}