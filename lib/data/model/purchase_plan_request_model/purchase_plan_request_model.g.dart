// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_plan_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchasePlanRequestModelImpl _$$PurchasePlanRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchasePlanRequestModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  PurchasePlanRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PurchasePlanRequestModelImplToJson(
        _$PurchasePlanRequestModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$PurchasePlanRequestImpl _$$PurchasePlanRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchasePlanRequestImpl(
      planId: json['_id'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      userId: json['userId'] == null
          ? null
          : UserModel.fromJson(json['userId'] as Map<String, dynamic>),
      planName: json['planName'] as String? ?? '',
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      purchaseDate: json['purchaseDate'] as String? ?? '',
      expiry: json['expiry'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$PurchasePlanRequestImplToJson(
        _$PurchasePlanRequestImpl instance) =>
    <String, dynamic>{
      '_id': instance.planId,
      'status': instance.status,
      'userId': instance.userId,
      'planName': instance.planName,
      'amount': instance.amount,
      'purchaseDate': instance.purchaseDate,
      'expiry': instance.expiry,
      'createdAt': instance.createdAt,
      'image': instance.image,
    };
