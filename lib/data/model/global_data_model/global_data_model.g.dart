// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalDataModelImpl _$$GlobalDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalDataModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : GlobalData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GlobalDataModelImplToJson(
        _$GlobalDataModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$GlobalDataImpl _$$GlobalDataImplFromJson(Map<String, dynamic> json) =>
    _$GlobalDataImpl(
      id: json['_id'] as String? ?? '',
      qrCode: json['qrCode'] as String? ?? '',
      silverLock: json['silverLock'] as bool? ?? false,
      goldLock: json['goldLock'] as bool? ?? false,
      platinumLock: json['platinumLock'] as bool? ?? false,
      diamondLock: json['diamondLock'] as bool? ?? false,
      termsConditions: json['termsConditions'] as String? ?? '',
      impMsg: json['impMsg'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$GlobalDataImplToJson(_$GlobalDataImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'qrCode': instance.qrCode,
      'silverLock': instance.silverLock,
      'goldLock': instance.goldLock,
      'platinumLock': instance.platinumLock,
      'diamondLock': instance.diamondLock,
      'termsConditions': instance.termsConditions,
      'impMsg': instance.impMsg,
      'createdAt': instance.createdAt,
    };
