import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model.g.dart';
part 'register_model.freezed.dart';

@freezed
class RegisterModel with _$RegisterModel{
  factory RegisterModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

}