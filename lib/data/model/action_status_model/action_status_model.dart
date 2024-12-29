import 'package:freezed_annotation/freezed_annotation.dart';
part 'action_status_model.g.dart';
part 'action_status_model.freezed.dart';

@freezed
class ActionStatusModel with _$ActionStatusModel{
  factory ActionStatusModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
  }) = _ActionStatusModel;

  factory ActionStatusModel.fromJson(Map<String, dynamic> json) => _$ActionStatusModelFromJson(json);

}