import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/my_team_model/my_team_model.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/data/repository/membership_repo.dart';
import 'package:r4everstore/services/session.dart';
import 'package:r4everstore/utils/enum.dart';

part 'membership_event.dart';
part 'membership_state.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final MembershipRepo membershipRepo;
  MembershipBloc({required this.membershipRepo}) : super(const MembershipState()) {
    on<ChangePlanDetails>(_changePlanDetails);
    on<PurchasePlan>(_purchasePlan);
    on<GetMyTeam>(_getMyTeam);
  }

  void _changePlanDetails(ChangePlanDetails event, Emitter<MembershipState> emit){
    emit(state.copyWith(planName: event.planName, amount: event.amount));
  }

  void _purchasePlan(PurchasePlan event, Emitter<MembershipState> emit) async{
    try{
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "planName": state.planName,
        "amount": state.amount,
        "purchaseDate": "${DateTime.now()}",
        "expiry": "${DateTime.now().add(const Duration(days: 180))}",
      };
      ActionStatusModel res = await membershipRepo.purchasePlan(data);
      if(res.status){
        await Session.changePlan(state.planName);
        emit(state.copyWith(actionApiStatus: ApiStatus.success, message: res.message));
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

  void _getMyTeam(GetMyTeam event, Emitter<MembershipState> emit) async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      MyTeamModel res = await membershipRepo.getMyTeam();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success, myTeam: res.data, message: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, message: e.toString()));
    }
  }

}
