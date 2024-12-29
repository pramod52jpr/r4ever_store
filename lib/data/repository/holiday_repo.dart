import 'package:flutter/cupertino.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/all_holidays_model/all_holidays_model.dart';
import 'package:r4everstore/data/network/api_services.dart';

class HolidayRepo{
  final ApiServices _api = ApiServices();

  Future getHolidays() async{
    try{
      var res = await _api.getRequest("holiday/get_holidays");
      return AllHolidaysModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future addHolidays(Map<String, dynamic> data, {required bool update}) async{
    try{
      var res = await _api.postRequest(update ? "holiday/update_holiday" : "holiday/add_holiday", data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future deleteHoliday(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest("holiday/delete_holiday", data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

}