import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_task_model.g.dart';
part 'all_task_model.freezed.dart';

@freezed
class AllTaskModel with _$AllTaskModel{
  factory AllTaskModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<TaskModel> data,
  }) = _AllTaskModel;

  factory AllTaskModel.fromJson(Map<String, dynamic> json) => _$AllTaskModelFromJson(json);

}

@freezed
class TaskModel with _$TaskModel{
  factory TaskModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'link') String link,
    @Default('') @JsonKey(name: 'category') String category,
    @Default('') @JsonKey(name: 'createdAt') String createdAt,
    @Default('') @JsonKey(name: 'updatedAt') String updatedAt,
    @Default(false) @JsonKey(name: 'assigned') bool assigned,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

}