import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_holidays_model.g.dart';
part 'all_holidays_model.freezed.dart';

@freezed
class AllHolidaysModel with _$AllHolidaysModel{
  factory AllHolidaysModel({
    @Default(false) @JsonKey(name: 'status') bool status,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'data') List<HolidayModel> data,
  }) = _AllHolidaysModel;

  factory AllHolidaysModel.fromJson(Map<String, dynamic> json) => _$AllHolidaysModelFromJson(json);

}

@freezed
class HolidayModel with _$HolidayModel{
  factory HolidayModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') @JsonKey(name: 'title') String title,
    @Default(0) @JsonKey(name: 'day') int day,
    @Default(0) @JsonKey(name: 'month') int month,
  }) = _HolidayModel;

  factory HolidayModel.fromJson(Map<String, dynamic> json) => _$HolidayModelFromJson(json);

}