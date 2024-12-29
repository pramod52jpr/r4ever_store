part of 'profile_bloc.dart';

class ProfileEvent extends Equatable{
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserData extends ProfileEvent{
  final String? name;
  final String? age;
  final String? gender;
  final String? work;
  final String? whatsappNo;
  final String? location;

  const UpdateUserData({this.name, this.age, this.gender, this.work, this.whatsappNo, this.location});

  @override
  List<Object?> get props => [
    name,
    age,
    gender,
    work,
    whatsappNo,
    location,
  ];
}

class FetchProfileData extends ProfileEvent{}

class UpdateProfileData extends ProfileEvent{}

class UpdateBankData extends ProfileEvent{
  final String? accountNo;
  final String? bankName;
  final String? ifscCode;

  const UpdateBankData({this.accountNo, this.bankName, this.ifscCode});

  @override
  List<Object?> get props => [
    accountNo,
    bankName,
    ifscCode,
  ];
}

class FetchBankDetails extends ProfileEvent{}

class UpdateBankDetails extends ProfileEvent{}

class FetchAllBankDetails extends ProfileEvent{}

class FetchAllUsersDetails extends ProfileEvent{}

class FetchAllWithdrawRequest extends ProfileEvent{}

class FetchMyWithdrawalRequests extends ProfileEvent{}

class BlockUnblockUser extends ProfileEvent{
  final String userId;
  final bool block;
  const BlockUnblockUser({required this.userId, required this.block});

  @override
  List<Object?> get props => [
    userId,
    block,
  ];
}

class SendMoneySuccess extends ProfileEvent{
  final String withdrawId;
  const SendMoneySuccess({required this.withdrawId});

  @override
  List<Object?> get props => [
    withdrawId,
  ];
}