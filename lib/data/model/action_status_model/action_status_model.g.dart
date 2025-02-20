// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionStatusModelImpl _$$ActionStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActionStatusModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$ActionStatusModelImplToJson(
        _$ActionStatusModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'url': instance.url,
    };
