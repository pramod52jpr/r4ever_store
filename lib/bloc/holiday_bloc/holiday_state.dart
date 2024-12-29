part of 'holiday_bloc.dart';

class HolidayState extends Equatable {
  final int month;
  final int day;
  final String title;
  final List<HolidayModel> holidaysData;
  final ApiStatus fetchDataApiStatus;
  final ApiStatus actionApiStatus;
  final ApiStatus deleteApiStatus;
  final String message;

  const HolidayState({
    this.month = 1,
    this.day = 1,
    this.title = '',
    this.holidaysData = const [],
    this.fetchDataApiStatus = ApiStatus.initial,
    this.actionApiStatus = ApiStatus.initial,
    this.deleteApiStatus = ApiStatus.initial,
    this.message = '',
  });
  HolidayState copyWith({
    int? month,
    int? day,
    String? title,
    List<HolidayModel>? holidaysData,
    ApiStatus? fetchDataApiStatus,
    ApiStatus? actionApiStatus,
    ApiStatus? deleteApiStatus,
    String? message,
  }){
    return HolidayState(
      month: month ?? this.month,
      day: day ?? this.day,
      title: title ?? this.title,
      holidaysData: holidaysData ?? this.holidaysData,
      fetchDataApiStatus: fetchDataApiStatus ?? this.fetchDataApiStatus,
      actionApiStatus: actionApiStatus ?? this.actionApiStatus,
      deleteApiStatus: deleteApiStatus ?? this.deleteApiStatus,
      message: message ?? this.message,
    );
  }


  @override
  List<Object?> get props => [
    month,
    day,
    title,
    holidaysData,
    fetchDataApiStatus,
    actionApiStatus,
    deleteApiStatus,
    message,
  ];
}