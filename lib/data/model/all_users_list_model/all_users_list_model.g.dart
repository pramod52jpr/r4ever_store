// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_users_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllUsersListModelImpl _$$AllUsersListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllUsersListModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AllUsersListModelImplToJson(
        _$AllUsersListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
