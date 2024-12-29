// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refer_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferCodeModelImpl _$$ReferCodeModelImplFromJson(Map<String, dynamic> json) =>
    _$ReferCodeModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      referCodeData: json['data'] == null
          ? null
          : ReferCodeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReferCodeModelImplToJson(
        _$ReferCodeModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.referCodeData,
    };

_$ReferCodeDataImpl _$$ReferCodeDataImplFromJson(Map<String, dynamic> json) =>
    _$ReferCodeDataImpl(
      referCode: json['refer_code'] as String? ?? '',
    );

Map<String, dynamic> _$$ReferCodeDataImplToJson(_$ReferCodeDataImpl instance) =>
    <String, dynamic>{
      'refer_code': instance.referCode,
    };
