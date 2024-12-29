import 'package:freezed_annotation/freezed_annotation.dart';
part 'global_data_model.g.dart';
part 'global_data_model.freezed.dart';

@freezed
class GlobalDataModel with _$GlobalDataModel{
  factory GlobalDataModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @JsonKey(name: 'data') GlobalData? data,
  }) = _GlobalDataModel;

  factory GlobalDataModel.fromJson(Map<String, dynamic> json) => _$GlobalDataModelFromJson(json);

}

@freezed
class GlobalData with _$GlobalData{
  factory GlobalData({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'qrCode') String qrCode,
    @Default(false) @JsonKey(name: 'silverLock') bool silverLock,
    @Default(false) @JsonKey(name: 'goldLock') bool goldLock,
    @Default(false) @JsonKey(name: 'platinumLock') bool platinumLock,
    @Default(false) @JsonKey(name: 'diamondLock') bool diamondLock,
    @Default('') @JsonKey(name: 'termsConditions') String termsConditions,
    @Default('') @JsonKey(name: 'impMsg') String impMsg,
    @Default('') @JsonKey(name: 'createdAt') String createdAt,
  }) = _GlobalData;

  factory GlobalData.fromJson(Map<String, dynamic> json) => _$GlobalDataFromJson(json);

}