part of 'auth_bloc.dart';

class AuthState extends Equatable{
  final String referralId;
  final String fullName;
  final String mobileNo;
  final String password;

  final String otp;


  final ApiStatus loginApiStatus;
  final ApiStatus registerApiStatus;
  final String successMsg;
  final String error;

  final String amount;
  final String referCode;
  final int wallet;
  final ApiStatus fetchDataApiStatus;
  final ApiStatus actionApiStatus;
  final String message;

  const AuthState({
    this.referralId = '',
    this.fullName = '',
    this.mobileNo = '',
    this.password = '',

    this.otp = '',

    this.loginApiStatus = ApiStatus.initial,
    this.registerApiStatus = ApiStatus.initial,
    this.successMsg = '',
    this.error = '',

    this.amount = '',
    this.referCode = '',
    this.wallet = 0,
    this.fetchDataApiStatus = ApiStatus.initial,
    this.actionApiStatus = ApiStatus.initial,
    this.message = '',
  });

  AuthState copyWith({
    String? referralId,
    String? fullName,
    String? mobileNo,
    String? password,

    String? otp,

    ApiStatus? loginApiStatus,
    ApiStatus? registerApiStatus,
    String? successMsg,
    String? error,

    String? amount,
    String? referCode,
    int? wallet,
    ApiStatus? fetchDataApiStatus,
    ApiStatus? actionApiStatus,
    String? message,
  }){
    return AuthState(
      referralId: referralId ?? this.referralId,
      fullName: fullName ?? this.fullName,
      mobileNo: mobileNo ?? this.mobileNo,
      password: password ?? this.password,

      otp: otp ?? this.otp,

      loginApiStatus: loginApiStatus ?? this.loginApiStatus,
      registerApiStatus: registerApiStatus ?? this.registerApiStatus,
      successMsg: successMsg ?? this.successMsg,
      error: error ?? this.error,

      amount: amount ?? this.amount,
      referCode: referCode ?? this.referCode,
      wallet: wallet ?? this.wallet,
      fetchDataApiStatus: fetchDataApiStatus ?? this.fetchDataApiStatus,
      actionApiStatus: actionApiStatus ?? this.actionApiStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    referralId,
    fullName,
    mobileNo,
    password,

    otp,

    loginApiStatus,
    registerApiStatus,
    successMsg,
    error,

    amount,
    referCode,
    wallet,
    fetchDataApiStatus,
    actionApiStatus,
    message,
  ];
}