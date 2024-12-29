import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/all_holidays_model/all_holidays_model.dart';
import 'package:r4everstore/data/repository/holiday_repo.dart';
import 'package:r4everstore/utils/enum.dart';

part 'holiday_event.dart';
part 'holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  final HolidayRepo holidayRepo;
  HolidayBloc({required this.holidayRepo}) : super(const HolidayState()) {
    on<GetHolidaysData>(_getHolidaysData);
    on<ChangeHolidayFields>(_changeHolidayFields);
    on<AddNewHoliday>(_addNewHoliday);
    on<DeleteHoliday>(_deleteHoliday);
  }

  void _getHolidaysData(GetHolidaysData event, Emitter<HolidayState> emit) async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      AllHolidaysModel res = await holidayRepo.getHolidays();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success, holidaysData: res.data, message: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, message: e.toString()));
    }
  }

  void _changeHolidayFields(ChangeHolidayFields event, Emitter<HolidayState> emit){
    emit(state.copyWith(month: event.month, day: event.day, title: event.title));
  }

  void _addNewHoliday(AddNewHoliday event, Emitter<HolidayState> emit) async{
    try{
      if(state.title.isEmpty) throw 'Enter the title';
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "title": state.title,
        "day": state.day,
        "month": state.month,
      };
      if(event.holidayId != null){
        data.addAll({
          "holidayId": event.holidayId,
        });
      }
      ActionStatusModel res = await holidayRepo.addHolidays(data, update: event.holidayId != null);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, message: res.message));
        emit(state.copyWith(title: '', day: 1, month: 1));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, message: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }

  void _deleteHoliday(DeleteHoliday event, Emitter<HolidayState> emit) async{
    try{
      emit(state.copyWith(deleteApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "holidayId": event.holidayId,
      };
      ActionStatusModel res = await holidayRepo.deleteHoliday(data);
      if(res.status){
        emit(state.copyWith(deleteApiStatus: ApiStatus.success, message: res.message));
        emit(state.copyWith(title: '', day: 1, month: 1));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(deleteApiStatus: ApiStatus.error, message: e.toString()));
    }finally{
      emit(state.copyWith(deleteApiStatus: ApiStatus.initial));
    }
  }

}
