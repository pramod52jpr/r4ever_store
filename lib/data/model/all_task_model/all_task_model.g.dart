// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllTaskModelImpl _$$AllTaskModelImplFromJson(Map<String, dynamic> json) =>
    _$AllTaskModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AllTaskModelImplToJson(_$AllTaskModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['_id'] as String? ?? '',
      link: json['link'] as String? ?? '',
      category: json['category'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      assigned: json['assigned'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'link': instance.link,
      'category': instance.category,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'assigned': instance.assigned,
    };
