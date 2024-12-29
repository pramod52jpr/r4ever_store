import 'package:freezed_annotation/freezed_annotation.dart';
part 'refer_code_model.g.dart';
part 'refer_code_model.freezed.dart';

@freezed
class ReferCodeModel with _$ReferCodeModel{
  factory ReferCodeModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @JsonKey(name: 'data') ReferCodeData? referCodeData,
  }) = _ReferCodeModel;

  factory ReferCodeModel.fromJson(Map<String, dynamic> json) => _$ReferCodeModelFromJson(json);

}

@freezed
class ReferCodeData with _$ReferCodeData{
  factory ReferCodeData({
    @Default('') @JsonKey(name: 'refer_code') String referCode,
  }) = _ReferCodeData;

  factory ReferCodeData.fromJson(Map<String, dynamic> json) => _$ReferCodeDataFromJson(json);

}