import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
part 'purchase_plan_request_model.g.dart';
part 'purchase_plan_request_model.freezed.dart';

@freezed
class PurchasePlanRequestModel with _$PurchasePlanRequestModel{
  factory PurchasePlanRequestModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<PurchasePlanRequest> data,
  }) = _PurchasePlanRequestModel;

  factory PurchasePlanRequestModel.fromJson(Map<String, dynamic> json) => _$PurchasePlanRequestModelFromJson(json);

}

@freezed
class PurchasePlanRequest with _$PurchasePlanRequest{
  factory PurchasePlanRequest({
    @Default('') @JsonKey(name: '_id') String planId,
    @Default(false) @JsonKey(name: 'status') bool status,
    @JsonKey(name: 'userId') UserModel? userId,
    @Default('') @JsonKey(name: 'planName') String planName,
    @Default(0) @JsonKey(name: 'amount') int amount,
    @Default('') @JsonKey(name: 'purchaseDate') String purchaseDate,
    @Default('') @JsonKey(name: 'expiry') String expiry,
    @Default('') @JsonKey(name: 'createdAt') String createdAt,
    @Default('') @JsonKey(name: 'image') String image,
  }) = _PurchasePlanRequest;

  factory PurchasePlanRequest.fromJson(Map<String, dynamic> json) => _$PurchasePlanRequestFromJson(json);

}