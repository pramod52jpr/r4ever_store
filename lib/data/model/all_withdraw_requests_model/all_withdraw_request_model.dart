import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/bank_detail_model/bank_detail_model.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
part 'all_withdraw_request_model.g.dart';
part 'all_withdraw_request_model.freezed.dart';

@freezed
class AllWithdrawRequestsModel with _$AllWithdrawRequestsModel{
  factory AllWithdrawRequestsModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<WithdrawModel> data,
  }) = _AllWithdrawRequestsModel;

  factory AllWithdrawRequestsModel.fromJson(Map<String, dynamic> json) => _$AllWithdrawRequestsModelFromJson(json);

}

@freezed
class WithdrawModel with _$WithdrawModel{
  factory WithdrawModel({
    @Default('') @JsonKey(name: '_id') String id,
    @JsonKey(name: 'userId') UserModel? userId,
    @JsonKey(name: 'bankDetails') WithdrawBankDetail? bankDetails,
    @Default(0) @JsonKey(name: 'amount') int amount,
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default('') @JsonKey(name: 'createdAt') String createdAt,
    @Default('') @JsonKey(name: 'updatedAt') String updatedAt,
  }) = _WithdrawModel;

  factory WithdrawModel.fromJson(Map<String, dynamic> json) => _$WithdrawModelFromJson(json);

}


@freezed
class WithdrawBankDetail with _$WithdrawBankDetail{
  factory WithdrawBankDetail({
    @Default('') @JsonKey(name: 'accountNo') String accountNo,
    @Default('') @JsonKey(name: 'bankName') String bankName,
    @Default('') @JsonKey(name: 'ifscCode') String ifscCode,
    @Default('') @JsonKey(name: 'userId') String userId,
  }) = _WithdrawBankDetail;

  factory WithdrawBankDetail.fromJson(Map<String, dynamic> json) => _$WithdrawBankDetailFromJson(json);

}