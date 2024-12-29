import 'package:flutter/foundation.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/all_task_model/all_task_model.dart';
import 'package:r4everstore/data/model/bank_detail_model/bank_detail_model.dart';
import 'package:r4everstore/data/model/login_model/login_model.dart';
import 'package:r4everstore/data/model/my_task_model/my_task_model.dart';
import 'package:r4everstore/data/model/register_model/register_model.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/data/network/api_services.dart';

class TaskRepo{
  final ApiServices _api = ApiServices();

  Future fetchAllTaskData(Map<String, dynamic> data) async{
    try{
      var res = await _api.getRequest('task/get_all_tasks', data: data);
      return AllTaskModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future uploadTask({required Map<String, dynamic> data, bool update = false}) async{
    try{
      var res = await _api.postRequest(update ? 'task/update_task' : 'task/upload_task', data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future uploadNonYoutubeTask({required Map<String, dynamic> data, bool update = false}) async{
    try{
      var res = await _api.postRequest(update ? 'task/update_non_youtube_task' : 'task/upload_non_youtube_task', data: data, withFile: true);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future deleteTask(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('task/delete_task', data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future addTaskWork(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('task/add_task_work', data: data);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future fetchMyTask() async{
    try{
      var res = await _api.getRequest('task/get_my_task_work');
      return MyTaskModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  Future updateTaskWork(Map<String, dynamic> data) async{
    try{
      var res = await _api.postRequest('task/update_task_work',data: data, withFile: true);
      return ActionStatusModel.fromJson(res);
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

}