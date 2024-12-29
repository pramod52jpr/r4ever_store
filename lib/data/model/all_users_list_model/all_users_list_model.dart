import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
part 'all_users_list_model.g.dart';
part 'all_users_list_model.freezed.dart';

@freezed
class AllUsersListModel with _$AllUsersListModel{
  factory AllUsersListModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<UserModel> data,
  }) = _AllUsersListModel;

  factory AllUsersListModel.fromJson(Map<String, dynamic> json) => _$AllUsersListModelFromJson(json);

}