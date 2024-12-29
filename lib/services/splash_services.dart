import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/services/session.dart';

class SplashServices{
  static void isLogin(BuildContext context) async{
    try{
      await Session.saveLoginData().then((value) {
          print("token ${Session.token}");
          print("value ${value}");
          print("isLogin ${Session.isLogin}");
        if(value){
          context.read<AuthBloc>().add(GetUpdatedUserData());
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeBar, (route) => false);
          },);
        }else{
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
          },);
        }
      });
    }catch(e){
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
      },);
    }
  }
}