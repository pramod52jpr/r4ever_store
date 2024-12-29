import 'package:flutter/cupertino.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/my_team_model/my_team_model.dart';
import 'package:r4everstore/data/network/api_services.dart';

class MembershipRepo{
  final ApiServices _api = ApiServices();

  Future purchasePlan(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest("plan/add_purchase_plan", data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future getMyTeam() async{
    try{
      var res = await _api.getRequest("profile/get_my_team");
      return MyTeamModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

}