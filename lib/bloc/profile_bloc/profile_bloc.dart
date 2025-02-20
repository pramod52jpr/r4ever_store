import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/all_bank_detail_model/all_bank_detail_model.dart';
import 'package:r4everstore/data/model/all_users_list_model/all_users_list_model.dart';
import 'package:r4everstore/data/model/all_withdraw_requests_model/all_withdraw_request_model.dart';
import 'package:r4everstore/data/model/bank_detail_model/bank_detail_model.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/utils/enum.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  late ProfileRepo profileRepo;
  ProfileBloc({required this.profileRepo}) : super(const ProfileState()){
    on<UpdateUserData>(_updateUserData);
    on<FetchProfileData>(_fetchProfileData);
    on<UpdateProfileData>(_updateProfileData);

    on<UpdateBankData>(_updateBankData);
    on<FetchBankDetails>(_fetchBankDetails);
    on<UpdateBankDetails>(_updateBankDetails);

    on<FetchAllBankDetails>(_fetchAllBankDetails);
    on<FetchAllUsersDetails>(_fetchAllUsersDetails);
    on<FetchAllWithdrawRequest>(_fetchAllWithdrawRequest);
    on<FetchMyWithdrawalRequests>(_fetchMyWithdrawalRequests);

    on<BlockUnblockUser>(_blockUnblockUser);
    on<SendMoneySuccess>(_sendMoneySuccess);
  }

  void _updateUserData(UpdateUserData event, Emitter<ProfileState> emit){
    emit(state.copyWith(
        userData: state.userData!.copyWith(
          name: event.name ?? state.userData!.name,
          age: event.age ?? state.userData!.age,
          gender: event.gender ?? state.userData!.gender,
          work: event.work ?? state.userData!.work,
          whatsappNo: event.whatsappNo ?? state.userData!.whatsappNo,
          location: event.location ?? state.userData!.location,
        )));
  }

  void _fetchProfileData(FetchProfileData event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      ViewProfileModel res = await profileRepo.fetchProfileData();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success,userData: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _updateProfileData(UpdateProfileData event, Emitter<ProfileState> emit)async{
    try{
      if(state.userData!.name.isEmpty) throw 'Enter Your Name';
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "name" : state.userData!.name,
        "age" : state.userData!.age,
        "gender": state.userData!.gender,
        "work": state.userData!.work,
        "whatsappNo": state.userData!.whatsappNo,
        "location": state.userData!.location,
      };
      ActionStatusModel res = await profileRepo.updateProfileData(data);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }


  void _updateBankData(UpdateBankData event, Emitter<ProfileState> emit){
    emit(state.copyWith(
        bankDetail: state.bankDetail!.copyWith(
          bankName: event.bankName ?? state.bankDetail!.bankName,
          accountNo: event.accountNo ?? state.bankDetail!.accountNo,
          ifscCode: event.ifscCode ?? state.bankDetail!.ifscCode,
        )));
  }

  void _fetchBankDetails(FetchBankDetails event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      BankDetailModel res = await profileRepo.fetchBankDetails();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success,bankDetail: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _updateBankDetails(UpdateBankDetails event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "accountNo": state.bankDetail!.accountNo,
        "bankName": state.bankDetail!.bankName,
        "ifscCode": state.bankDetail!.ifscCode,
      };
      ActionStatusModel res = await profileRepo.updateBankDetails(data);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }

  void _fetchAllBankDetails(FetchAllBankDetails event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      AllBankDetailModel res = await profileRepo.fetchAllBankDetailsForAdmin();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success,allBankDetail: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _fetchAllUsersDetails(FetchAllUsersDetails event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      AllUsersListModel res = await profileRepo.fetchAllUsersDetailsForAdmin();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success,allUsersList: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _blockUnblockUser(BlockUnblockUser event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "userId": event.userId,
        "block": event.block,
      };
      ActionStatusModel res = await profileRepo.blockUnblockUser(data);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }

  void _fetchAllWithdrawRequest(FetchAllWithdrawRequest event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      AllWithdrawRequestsModel res = await profileRepo.fetchAllWithdrawalRequestForAdmin();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success,allWithdrawRequestList: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _fetchMyWithdrawalRequests(FetchMyWithdrawalRequests event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      AllWithdrawRequestsModel res = await profileRepo.fetchMyWithdrawalRequests();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success,allWithdrawRequestList: res.data, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, error: e.toString()));
    }
  }

  void _sendMoneySuccess(SendMoneySuccess event, Emitter<ProfileState> emit)async{
    try{
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "withdrawId": event.withdrawId,
      };
      ActionStatusModel res = await profileRepo.sendMoneySuccess(data);
      if(res.status){
        emit(state.copyWith(actionApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      // debugPrint(e.toString());
      // debugPrintStack(stackTrace: s);
      emit(state.copyWith(actionApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(actionApiStatus: ApiStatus.initial));
    }
  }

}