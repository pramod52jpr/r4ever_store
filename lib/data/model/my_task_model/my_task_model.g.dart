// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyTaskModelImpl _$$MyTaskModelImplFromJson(Map<String, dynamic> json) =>
    _$MyTaskModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TaskWork.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MyTaskModelImplToJson(_$MyTaskModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$TaskWorkImpl _$$TaskWorkImplFromJson(Map<String, dynamic> json) =>
    _$TaskWorkImpl(
      id: json['_id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      taskId: json['taskId'] == null
          ? null
          : TaskModel.fromJson(json['taskId'] as Map<String, dynamic>),
      completed: json['completed'] as bool? ?? false,
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$TaskWorkImplToJson(_$TaskWorkImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'taskId': instance.taskId,
      'completed': instance.completed,
      'image': instance.image,
    };
