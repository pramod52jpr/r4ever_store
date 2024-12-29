part of 'holiday_bloc.dart';

abstract class HolidayEvent extends Equatable {
  const HolidayEvent();

  @override
  List<Object?> get props => [];
}


class GetHolidaysData extends HolidayEvent{}

class ChangeHolidayFields extends HolidayEvent{
  final int? month;
  final int? day;
  final String? title;
  const ChangeHolidayFields({
    this.month,
    this.day,
    this.title,
  });

  @override
  List<Object?> get props => [
    month,
    day,
    title,
  ];
}

class AddNewHoliday extends HolidayEvent{
  final String? holidayId;
  const AddNewHoliday({this.holidayId});

  @override
  List<Object?> get props => [
    holidayId,
  ];
}

class DeleteHoliday extends HolidayEvent{
  final String holidayId;
  const DeleteHoliday({required this.holidayId});

  @override
  List<Object?> get props => [
    holidayId,
  ];
}