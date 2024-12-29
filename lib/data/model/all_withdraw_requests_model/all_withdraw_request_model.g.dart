// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_withdraw_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllWithdrawRequestsModelImpl _$$AllWithdrawRequestsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllWithdrawRequestsModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => WithdrawModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AllWithdrawRequestsModelImplToJson(
        _$AllWithdrawRequestsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$WithdrawModelImpl _$$WithdrawModelImplFromJson(Map<String, dynamic> json) =>
    _$WithdrawModelImpl(
      id: json['_id'] as String? ?? '',
      userId: json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>),
      bankDetails: json['bankDetails'] == null
          ? null
          : WithdrawBankDetail.fromJson(
              json['bankDetails'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      success: json['success'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$$WithdrawModelImplToJson(_$WithdrawModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'bankDetails': instance.bankDetails,
      'amount': instance.amount,
      'success': instance.success,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$WithdrawBankDetailImpl _$$WithdrawBankDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$WithdrawBankDetailImpl(
      accountNo: json['accountNo'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      ifscCode: json['ifscCode'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
    );

Map<String, dynamic> _$$WithdrawBankDetailImplToJson(
        _$WithdrawBankDetailImpl instance) =>
    <String, dynamic>{
      'accountNo': instance.accountNo,
      'bankName': instance.bankName,
      'ifscCode': instance.ifscCode,
      'userId': instance.userId,
    };
