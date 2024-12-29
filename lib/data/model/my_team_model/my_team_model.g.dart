// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyTeamModelModelImpl _$$MyTeamModelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyTeamModelModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MyTeamModelModelImplToJson(
        _$MyTeamModelModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
