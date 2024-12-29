// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_holidays_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllHolidaysModelImpl _$$AllHolidaysModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllHolidaysModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => HolidayModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AllHolidaysModelImplToJson(
        _$AllHolidaysModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$HolidayModelImpl _$$HolidayModelImplFromJson(Map<String, dynamic> json) =>
    _$HolidayModelImpl(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      day: (json['day'] as num?)?.toInt() ?? 0,
      month: (json['month'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HolidayModelImplToJson(_$HolidayModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'day': instance.day,
      'month': instance.month,
    };
