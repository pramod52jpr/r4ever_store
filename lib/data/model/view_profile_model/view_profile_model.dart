import 'package:freezed_annotation/freezed_annotation.dart';
part 'view_profile_model.g.dart';
part 'view_profile_model.freezed.dart';

@freezed
class ViewProfileModel with _$ViewProfileModel{
  factory ViewProfileModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @JsonKey(name: 'data') UserModel? data,
  }) = _ViewProfileModel;

  factory ViewProfileModel.fromJson(Map<String, dynamic> json) => _$ViewProfileModelFromJson(json);

}

@freezed
class UserModel with _$UserModel{
  factory UserModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'refer_code') String referCode,
    @Default(0) @JsonKey(name: 'referral_money') int referralMoney,
    @Default('') @JsonKey(name: 'type') String type,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'phone') String phone,
    @Default('') @JsonKey(name: 'age') String age,
    @Default('') @JsonKey(name: 'gender') String gender,
    @Default('') @JsonKey(name: 'work') String work,
    @Default('') @JsonKey(name: 'whatsappNo') String whatsappNo,
    @Default('') @JsonKey(name: 'location') String location,
    @Default(false) @JsonKey(name: 'blocked') bool blocked,
    @Default(0) @JsonKey(name: 'level') int level,
    @JsonKey(name: 'plan') PlanModel? plan,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

}

@freezed
class PlanModel with _$PlanModel{
  factory PlanModel({
    @Default('') @JsonKey(name: '_id') String planId,
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'planName') String planName,
    @Default(0) @JsonKey(name: 'amount') int amount,
    @Default('') @JsonKey(name: 'purchaseDate') String purchaseDate,
    @Default('') @JsonKey(name: 'expiry') String expiry,
    @Default('') @JsonKey(name: 'createdAt') String createdAt,
    @Default('') @JsonKey(name: 'image') String image,
  }) = _PlanModel;

  factory PlanModel.fromJson(Map<String, dynamic> json) => _$PlanModelFromJson(json);

}