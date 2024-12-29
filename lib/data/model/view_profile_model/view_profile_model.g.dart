// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewProfileModelImpl _$$ViewProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewProfileModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewProfileModelImplToJson(
        _$ViewProfileModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['_id'] as String? ?? '',
      referCode: json['refer_code'] as String? ?? '',
      referralMoney: (json['referral_money'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      age: json['age'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      work: json['work'] as String? ?? '',
      whatsappNo: json['whatsappNo'] as String? ?? '',
      location: json['location'] as String? ?? '',
      blocked: json['blocked'] as bool? ?? false,
      level: (json['level'] as num?)?.toInt() ?? 0,
      plan: json['plan'] == null
          ? null
          : PlanModel.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'refer_code': instance.referCode,
      'referral_money': instance.referralMoney,
      'type': instance.type,
      'name': instance.name,
      'phone': instance.phone,
      'age': instance.age,
      'gender': instance.gender,
      'work': instance.work,
      'whatsappNo': instance.whatsappNo,
      'location': instance.location,
      'blocked': instance.blocked,
      'level': instance.level,
      'plan': instance.plan,
    };

_$PlanModelImpl _$$PlanModelImplFromJson(Map<String, dynamic> json) =>
    _$PlanModelImpl(
      planId: json['_id'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      planName: json['planName'] as String? ?? '',
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      purchaseDate: json['purchaseDate'] as String? ?? '',
      expiry: json['expiry'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$PlanModelImplToJson(_$PlanModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.planId,
      'status': instance.status,
      'planName': instance.planName,
      'amount': instance.amount,
      'purchaseDate': instance.purchaseDate,
      'expiry': instance.expiry,
      'createdAt': instance.createdAt,
      'image': instance.image,
    };
