import 'dart:convert';

import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/services/local_storage.dart';

class Session{
  static final Session _session = Session._internal();
  static String? token;
  static bool isLogin = false;
  static bool isAdmin = false;
  static UserModel? userData;
  static String plan = '';

  Session._internal();

  factory Session(){
    return _session;
  }

  static Future<bool> changePlan(String planName)async{
    plan = planName;
    bool savePlan = await LocalStorage.setItem('plan', planName);
    return savePlan;
  }

  static Future<bool> saveDataInPref(String tokenData, UserModel userModel, String planName) async{
    bool saveToken = await LocalStorage.setItem('token', tokenData);
    bool saveUserData = await LocalStorage.setItem('userData', jsonEncode(userModel.toJson()));
    bool savePlan = await LocalStorage.setItem('plan', planName);
    if(saveToken && saveUserData && savePlan){
      isLogin = true;
      token = tokenData;
      userData = userModel;
      isAdmin = userModel.type == "admin";
      plan = planName;
      return true;
    }
    userData = null;
    token = null;
    isLogin = false;
    isAdmin = false;
    plan == '';
    return false;
  }

  static Future<bool> saveUpdatedDataInPref(UserModel userModel, String planName) async{
    bool saveUserData = await LocalStorage.setItem('userData', jsonEncode(userModel.toJson()));
    bool savePlan = await LocalStorage.setItem('plan', planName);
    if(saveUserData && savePlan){
      isLogin = true;
      userData = userModel;
      isAdmin = userModel.type == "admin";
      plan = planName;
      return true;
    }
    userData = null;
    isLogin = false;
    isAdmin = false;
    plan == '';
    return false;
  }

  static Future<bool> saveLoginData() async{
    String? tokenData = await LocalStorage.getItem('token');
    String? user = await LocalStorage.getItem('userData');
    String? planName = await LocalStorage.getItem('plan');
    if(tokenData != null && user != null && planName != null){
      isLogin = true;
      token = tokenData;
      userData = UserModel.fromJson(jsonDecode(user));
      isAdmin = userData?.type == "admin";
      plan = planName;
      return true;
    }
    isLogin = false;
    token = null;
    userData = null;
    isAdmin = false;
    plan = '';
    return false;
  }

  static Future<bool> clearData() async{
    bool cleared = await LocalStorage.clear();
    if(cleared){
      isLogin = false;
      token = null;
      userData = null;
      isAdmin = false;
      plan = '';
      return true;
    }
    return false;
  }

}