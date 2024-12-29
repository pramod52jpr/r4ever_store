import 'package:flutter/foundation.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/all_bank_detail_model/all_bank_detail_model.dart';
import 'package:r4everstore/data/model/all_users_list_model/all_users_list_model.dart';
import 'package:r4everstore/data/model/all_withdraw_requests_model/all_withdraw_request_model.dart';
import 'package:r4everstore/data/model/bank_detail_model/bank_detail_model.dart';
import 'package:r4everstore/data/model/login_model/login_model.dart';
import 'package:r4everstore/data/model/register_model/register_model.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/data/network/api_services.dart';

class ProfileRepo{
  final ApiServices _api = ApiServices();
  
  Future fetchProfileData() async{
    try{
      var res = await _api.getRequest('profile/view_profile');
      return ViewProfileModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future updateProfileData(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('profile/update_profile', data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchBankDetails() async{
    try{
      var res = await _api.getRequest('bank/get_bank_details');
      return BankDetailModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future updateBankDetails(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('bank/update_bank_details', data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchAllBankDetailsForAdmin() async{
    try{
      var res = await _api.getRequest('bank/get_all_bank_details');
      return AllBankDetailModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchAllUsersDetailsForAdmin() async{
    try{
      var res = await _api.getRequest('auth/get_all_users_list');
      return AllUsersListModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future blockUnblockUser(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('auth/block_unblock_user', data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchAllWithdrawalRequestForAdmin() async{
    try{
      var res = await _api.getRequest('bank/get_all_withdraw_request');
      return AllWithdrawRequestsModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchMyWithdrawalRequests() async{
    try{
      var res = await _api.getRequest('bank/get_my_withdrawals');
      return AllWithdrawRequestsModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future sendMoneySuccess(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('bank/send_money_success', data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

}