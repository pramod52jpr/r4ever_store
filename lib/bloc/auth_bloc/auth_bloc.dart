import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/model/login_model/login_model.dart';
import 'package:r4everstore/data/model/refer_code_model/refer_code_model.dart';
import 'package:r4everstore/data/model/register_model/register_model.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/data/model/wallet_api_model/wallet_api_model.dart';
import 'package:r4everstore/data/repository/auth_repo.dart';
import 'package:r4everstore/services/session.dart';
import 'package:r4everstore/utils/enum.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  late AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(const AuthState()){
    on<ChangeAuthState>(_changeAuthState);
    on<RegisterUser>(_registerUser);
    on<LoginUser>(_loginUser);

    on<ChangeAmount>(_changeAmount);
    on<FetchWalletData>(_fetchWalletData);
    on<RechargeWallet>(_rechargeWallet);
    on<WithdrawAmountApi>(_withdrawAmountApi);
    on<GetReferCodeApi>(_getReferCodeApi);
    on<GetUpdatedUserData>(_getUpdatedUserData);
  }

  void _changeAuthState(ChangeAuthState event, Emitter<AuthState> emit){
    emit(state.copyWith(
        referralId: event.referralId,
        fullName: event.fullName,
        mobileNo: event.mobileNo,
        password: event.password,
      otp: event.otp,
    ));
  }

  void _registerUser(RegisterUser event, Emitter<AuthState> emit)async{
    try{
      if(state.fullName.isEmpty) throw 'Enter your name';
      if(state.mobileNo.isEmpty) throw 'Enter your mobile no';
      if(state.mobileNo.length < 10) throw 'Enter valid mobile no';
      if(state.password.isEmpty) throw 'Enter your password';
      if(state.password.length < 8) throw 'Password must be at least 8 characters';
      if(event.verifyOtp && state.otp.length != 6) throw 'Fill the otp';
      emit(state.copyWith(registerApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "name" : state.fullName,
        "phone" : state.mobileNo,
        "password" : state.password,
      };
      if(state.referralId.isNotEmpty){
        data.addAll({
          "referCode": state.referralId,
        });
      }
      if(event.verifyOtp){
        data.addAll({
          "otp": state.otp
        });
      }
      RegisterModel res = await authRepo.registerUser(data);
      if(res.status){
        emit(state.copyWith(registerApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(registerApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(registerApiStatus: ApiStatus.initial));
    }
  }

  void _loginUser(LoginUser event, Emitter<AuthState> emit)async{
    try{
      if(state.mobileNo.isEmpty) throw 'Enter mobile no';
      if(state.mobileNo.length < 10) throw 'Enter valid mobile no';
      if(state.password.isEmpty) throw 'Enter your password';
      emit(state.copyWith(loginApiStatus: ApiStatus.loading));
      Map<String, dynamic> data = {
        "phone" : state.mobileNo,
        "password" : state.password,
      };
      LoginModel res = await authRepo.loginUser(data);
      if(res.status){
        await Session.saveDataInPref(res.token, res.userData!, res.plan);
        emit(state.copyWith(loginApiStatus: ApiStatus.success, successMsg: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(loginApiStatus: ApiStatus.error, error: e.toString()));
    }finally{
      emit(state.copyWith(loginApiStatus: ApiStatus.initial));
    }
  }

  void _changeAmount(ChangeAmount event, Emitter<AuthState> emit){
    emit(state.copyWith(amount: event.amount));
  }

  void _fetchWalletData(FetchWalletData event, Emitter<AuthState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      WalletApiModel res = await authRepo.fetchWalletData();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success,wallet: res.walletData!.wallet, message: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, message: e.toString()));
    }
  }

  void _rechargeWallet(RechargeWallet event, Emitter<AuthState> emit)async{
    try{
      if(state.amount.isEmpty) throw 'Please enter the amount';
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      ActionStatusModel res = await authRepo.rechargeWalletData(amount: state.amount);
      if(res.status){
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

  void _withdrawAmountApi(WithdrawAmountApi event, Emitter<AuthState> emit)async{
    try{
      if(DateTime.now().weekday == 5 || DateTime.now().weekday == 6 || DateTime.now().weekday == 7) throw 'Withdraw days are only Mon-Thu';
      if(DateTime.now().hour < 6 || DateTime.now().hour >= 11) throw 'Withdraw time is only 6 AM - 11 AM';
      if(state.amount.isEmpty) throw 'Please Select the amount';
      if(int.parse(state.amount) < 250) throw 'Min. withdrawal should be 250/-';
      emit(state.copyWith(actionApiStatus: ApiStatus.loading));
      ActionStatusModel res = await authRepo.withdrawalAmountApi(amount: state.amount);
      if(res.status){
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

  void _getReferCodeApi(GetReferCodeApi event, Emitter<AuthState> emit)async{
    try{
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.loading));
      ReferCodeModel res = await authRepo.fetchReferCodeApi();
      if(res.status){
        emit(state.copyWith(fetchDataApiStatus: ApiStatus.success, referCode: res.referCodeData!.referCode, message: res.message));
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      emit(state.copyWith(fetchDataApiStatus: ApiStatus.error, message: e.toString()));
    }
  }

  void _getUpdatedUserData(GetUpdatedUserData event, Emitter<AuthState> emit)async{
    try{
      LoginModel res = await authRepo.getUserUpdatedData();
      if(res.status){
        await Session.saveUpdatedDataInPref(res.userData!, res.plan);
      }else{
        throw res.message;
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

}