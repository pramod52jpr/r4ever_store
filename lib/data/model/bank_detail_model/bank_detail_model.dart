import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
part 'bank_detail_model.g.dart';
part 'bank_detail_model.freezed.dart';

@freezed
class BankDetailModel with _$BankDetailModel{
  factory BankDetailModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @JsonKey(name: 'data') BankDetail? data,
  }) = _BankDetailModel;

  factory BankDetailModel.fromJson(Map<String, dynamic> json) => _$BankDetailModelFromJson(json);

}

@freezed
class BankDetail with _$BankDetail{
  factory BankDetail({
    @Default('') @JsonKey(name: 'accountNo') String accountNo,
    @Default('') @JsonKey(name: 'bankName') String bankName,
    @Default('') @JsonKey(name: 'ifscCode') String ifscCode,
    @JsonKey(name: 'userId') UserModel? userId,
  }) = _BankDetail;

  factory BankDetail.fromJson(Map<String, dynamic> json) => _$BankDetailFromJson(json);

}