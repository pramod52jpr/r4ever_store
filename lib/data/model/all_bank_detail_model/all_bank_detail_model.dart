import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/bank_detail_model/bank_detail_model.dart';
part 'all_bank_detail_model.g.dart';
part 'all_bank_detail_model.freezed.dart';

@freezed
class AllBankDetailModel with _$AllBankDetailModel{
  factory AllBankDetailModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<BankDetail> data,
  }) = _AllBankDetailModel;

  factory AllBankDetailModel.fromJson(Map<String, dynamic> json) => _$AllBankDetailModelFromJson(json);

}