// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_bank_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllBankDetailModelImpl _$$AllBankDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllBankDetailModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BankDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AllBankDetailModelImplToJson(
        _$AllBankDetailModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
