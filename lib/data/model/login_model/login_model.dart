import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
part 'login_model.g.dart';
part 'login_model.freezed.dart';

@freezed
class LoginModel with _$LoginModel{
  factory LoginModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default('') @JsonKey(name: 'token') String token,
    @JsonKey(name: 'data') UserModel? userData,
    @Default('') @JsonKey(name: 'plan') String plan,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

}