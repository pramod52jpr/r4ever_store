import 'package:flutter/foundation.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/login_model/login_model.dart';
import 'package:r4everstore/data/model/refer_code_model/refer_code_model.dart';
import 'package:r4everstore/data/model/register_model/register_model.dart';
import 'package:r4everstore/data/model/wallet_api_model/wallet_api_model.dart';
import 'package:r4everstore/data/network/api_services.dart';

class AuthRepo{
  final ApiServices _api = ApiServices();
  
  Future registerUser(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('auth/signup', data: data, token: false);
      return RegisterModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }
  Future loginUser(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('auth/signin', data: data, token: false);
      return LoginModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchWalletData() async{
    try{
      var res = await _api.getRequest('auth/get_wallet_data');
      return WalletApiModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future rechargeWalletData({required String amount}) async{
    try{
      var res = await _api.postRequest('auth/recharge_wallet', data: {
        "amount": amount
      });
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future withdrawalAmountApi({required String amount}) async{
    try{
      var res = await _api.postRequest('bank/add_withdraw_request', data: {
        "amount": amount
      });
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchReferCodeApi() async{
    try{
      var res = await _api.getRequest('auth/get_refer_code');
      return ReferCodeModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future getUserUpdatedData() async{
    try{
      var res = await _api.postRequest('auth/get_single_user');
      return LoginModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

}