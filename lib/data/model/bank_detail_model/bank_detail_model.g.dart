// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankDetailModelImpl _$$BankDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankDetailModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : BankDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BankDetailModelImplToJson(
        _$BankDetailModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$BankDetailImpl _$$BankDetailImplFromJson(Map<String, dynamic> json) =>
    _$BankDetailImpl(
      accountNo: json['accountNo'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      ifscCode: json['ifscCode'] as String? ?? '',
      userId: json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BankDetailImplToJson(_$BankDetailImpl instance) =>
    <String, dynamic>{
      'accountNo': instance.accountNo,
      'bankName': instance.bankName,
      'ifscCode': instance.ifscCode,
      'userId': instance.userId,
    };
