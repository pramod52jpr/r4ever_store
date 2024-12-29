import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
part 'my_team_model.g.dart';
part 'my_team_model.freezed.dart';

@freezed
class MyTeamModel with _$MyTeamModel{
  factory MyTeamModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<UserModel> data,
  }) = _MyTeamModelModel;

  factory MyTeamModel.fromJson(Map<String, dynamic> json) => _$MyTeamModelFromJson(json);

}