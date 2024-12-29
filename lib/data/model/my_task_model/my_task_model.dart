import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/all_task_model/all_task_model.dart';
part 'my_task_model.g.dart';
part 'my_task_model.freezed.dart';

@freezed
class MyTaskModel with _$MyTaskModel{
  factory MyTaskModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<TaskWork> data,
  }) = _MyTaskModel;

  factory MyTaskModel.fromJson(Map<String, dynamic> json) => _$MyTaskModelFromJson(json);

}

@freezed
class TaskWork with _$TaskWork{
  factory TaskWork({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'userId') String userId,
    @JsonKey(name: 'taskId') TaskModel? taskId,
    @Default(false) @JsonKey(name: 'completed') bool completed,
    @Default('') @JsonKey(name: 'image') String image,
  }) = _TaskWork;

  factory TaskWork.fromJson(Map<String, dynamic> json) => _$TaskWorkFromJson(json);

}