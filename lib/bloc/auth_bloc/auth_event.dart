part of 'auth_bloc.dart';

class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class ChangeAuthState extends AuthEvent{
  final String? referralId;
  final String? fullName;
  final String? mobileNo;
  final String? password;
  final String? otp;

  const ChangeAuthState({this.referralId, this.fullName, this.mobileNo, this.password, this.otp});

  @override
  List<Object?> get props => [referralId, fullName, mobileNo, password, otp];
}

class RegisterUser extends AuthEvent{
  final bool verifyOtp;
  const RegisterUser({this.verifyOtp = false});

  @override
  List<Object?> get props => [verifyOtp];
}
class LoginUser extends AuthEvent{}

class ChangeAmount extends AuthEvent{
  final String amount;
  const ChangeAmount({required this.amount});

  @override
  List<Object?> get props => [amount];
}

class FetchWalletData extends AuthEvent{}

class RechargeWallet extends AuthEvent{}

class WithdrawAmountApi extends AuthEvent{}

class GetReferCodeApi extends AuthEvent{}

class GetUpdatedUserData extends AuthEvent{}