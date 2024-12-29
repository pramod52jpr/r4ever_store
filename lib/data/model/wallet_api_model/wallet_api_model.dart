import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_api_model.g.dart';
part 'wallet_api_model.freezed.dart';

@freezed
class WalletApiModel with _$WalletApiModel{
  factory WalletApiModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @JsonKey(name: 'data') WalletData? walletData,
  }) = _WalletApiModel;

  factory WalletApiModel.fromJson(Map<String, dynamic> json) => _$WalletApiModelFromJson(json);

}

@freezed
class WalletData with _$WalletData{
  factory WalletData({
    @Default(0) @JsonKey(name: 'wallet') int wallet,
  }) = _WalletData;

  factory WalletData.fromJson(Map<String, dynamic> json) => _$WalletDataFromJson(json);

}