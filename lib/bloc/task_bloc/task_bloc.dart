import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/all_task_model/all_task_model.dart';
import 'package:r4everstore/data/model/my_task_model/my_task_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/data/repository/task_repo.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:uuid/uuid.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState>{
  late TaskRepo taskRepo;
  TaskBloc({required this.taskRepo}) : super(const TaskState()){
    on<ChangeTaskData>(_changeTaskData);
    on<FetchAllTaskData>(_fetchAllTaskData);
    on<UploadTask>(_uploadTask);
    on<DeleteTask>(_deleteTask);
    on<EmptyTaskData>(_emptyTaskData);

    on<AddTaskWork>(_addTaskWork);

    on<FetchMyTask>(_fetchMyTask);

    on<ChangeTaskImage>(_changeTaskImage);
    on<ChangeSubscribedStatus>(_changeSubscribedStatus);
    on<UpdateTaskWork>(_updateTaskWork);

    on<BackToInitial>(_backToInitial);
  }

  void _changeTaskData(ChangeTaskData event, Emitter<TaskState> emit){
    TaskModel taskModel = state.taskData == null
        ? TaskModel(link: event.link ?? '', category: event.category ?? '')
    : state.taskData!.copyWith(
      link: event.link ?? state.taskData!.link,
      category: event.category ?? state.taskData!.category,
    );
    emit(state.copyWith(
        taskData: taskModel,
      uploadVideoFile: event.uploadVideoFile,
    ));
  }

  void _fetchAllTaskData(FetchAllTaskData event, Emitter<TaskState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {};
      if(event.category != null){
        data = {
          "category": event.category,
        };
      }
      AllTaskModel res = await taskRepo.fetchAllTaskData(data);
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success, allTask: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _emptyTaskData(EmptyTaskData event, Emitter<TaskState> emit){
    emit(state.emptyAdminAddTaskData(taskData: null, uploadVideoFile: null));
  }

  void _uploadTask(UploadTask event, Emitter<TaskState> emit)async{
    try{
      if(state.taskData == null) throw 'Select the category';
      if(state.taskData!.category.isEmpty) throw 'Select the category';
      Map<String, dynamic> data = {};

      if(state.taskData!.category == 'youtube'){
        if(state.taskData!.link.isEmpty) throw 'Fill the link';
        if(!state.taskData!.link.contains('https://') && !state.taskData!.link.contains('http://')) throw 'Provide valid link';
        emit(state.copyWith(actionApiStatus: ApiStatus.loading));
        data = {
          "link": state.taskData!.link,
          "category": state.taskData!.category
        };
        if(event.taskId != null){
          data.addAll({
            "taskId": event.taskId,
          });
        }
      }else{
        if(state.uploadVideoFile == null) throw 'Upload the file';
        emit(state.copyWith(actionApiStatus: ApiStatus.loading));
        String fileName = "${const Uuid().v4()}.${(state.uploadVideoFile as File).path.split('.').last}";
        ActionStatusModel resp = await taskRepo.generateUrl({
          "key": fileName,
        });
        if(resp.status){
          await ApiServices().uploadFile(resp.url, state.uploadVideoFile);
          data = {
            "category": state.taskData!.category,
            "link": fileName
          };
          // if(state.uploadVideoFile is File){
          //   data.addAll({
          //     "file": await MultipartFile.fromFile(
          //       (state.uploadVideoFile as File).path,
          //       filename: (state.uploadVideoFile as File).path.split('/').last,
          //     )
          //   });
          // }
          if(event.taskId != null){
            data.addAll({
              "taskId": event.taskId,
            });
          }
        }
      }
      ActionStatusModel res = state.taskData!.category == 'youtube'
          ? await taskRepo.uploadTask(data: data, update: event.taskId != null)
          : await taskRepo.uploadNonYoutubeTask(data: data, update: event.taskId != null);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit)async{
    try{
      emit(state.copyWith(deleteApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "taskId": event.taskId,
      };
      ActionStatusModel res = await taskRepo.deleteTask(data);
      if(res.status){
        emit(state.copyWith(deleteApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(deleteApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(deleteApiStatus: ApiStatus.initial));
    }
  }

  void _addTaskWork(AddTaskWork event, Emitter<TaskState> emit)async{
    try{
      if(DateTime.now().hour < 8 || DateTime.now().hour >= 21) throw 'Add task time is 8 AM - 9 PM';
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "taskId": event.taskId,
      };
      ActionStatusModel res = await taskRepo.addTaskWork(data);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }

  void _fetchMyTask(FetchMyTask event, Emitter<TaskState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      MyTaskModel res = await taskRepo.fetchMyTask();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success, myTaskWork: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _changeTaskImage(ChangeTaskImage event, Emitter<TaskState> emit)async{
    emit(state.copyWith(taskImage: event.taskImage));
  }

  void _changeSubscribedStatus(ChangeSubscribedStatus event, Emitter<TaskState> emit)async{
    emit(state.copyWith(subscribed: event.subscribed));
  }

  void _updateTaskWork(UpdateTaskWork event, Emitter<TaskState> emit)async{
    try{
      if(!event.nonYoutubeTask && state.taskImage is! File) throw 'Please select the image';
      if(!event.nonYoutubeTask && !state.subscribed) throw 'Please subscribe the channel';
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "taskId": event.taskWorkId,
      };
      if(!event.nonYoutubeTask){
        String fileName = "${const Uuid().v4()}.${state.taskImage?.path.split('.').last}";
        ActionStatusModel response = await TaskRepo().generateUrl({
          "key": fileName,
        });
        if(response.status){
          await ApiServices().uploadFile(response.url, state.taskImage!);
          data.addAll({
            "image": fileName
            // "image": await MultipartFile.fromFile((state.taskImage as File).path, filename: (state.taskImage as File).path.split('/').last),
          });
        }else{
          throw "something went wrong";
        }
      }
      ActionStatusModel res = await taskRepo.updateTaskWork(data);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }


  void _backToInitial(BackToInitial event, Emitter<TaskState> emit)async{
    emit(state.backToInitial());
  }

}