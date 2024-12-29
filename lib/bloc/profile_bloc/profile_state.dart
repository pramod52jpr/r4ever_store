part of 'profile_bloc.dart';

class ProfileState extends Equatable{
  final UserModel? userData;
  final BankDetail? bankDetail;
  final List<BankDetail> allBankDetail;
  final List<UserModel> allUsersList;
  final List<WithdrawModel> allWithdrawRequestList;

  final ApiStatus fetchDataApiStatus;
  final ApiStatus actionApiStatus;
  final String successMsg;
  final String error;

  const ProfileState({
    this.userData,
    this.bankDetail,
    this.allBankDetail = const[],
    this.allUsersList = const[],
    this.allWithdrawRequestList = const[],

    this.fetchDataApiStatus = ApiStatus.initial,
    this.actionApiStatus = ApiStatus.initial,
    this.successMsg = '',
    this.error = '',
  });

  ProfileState copyWith({
    UserModel? userData,
    BankDetail? bankDetail,
    List<BankDetail>? allBankDetail,
    List<UserModel>? allUsersList,
    List<WithdrawModel>? allWithdrawRequestList,

    ApiStatus? fetchDataApiStatus,
    ApiStatus? actionApiStatus,
    String? successMsg,
    String? error,
  }){
    return ProfileState(
      userData: userData ?? this.userData,
      bankDetail: bankDetail ?? this.bankDetail,
      allBankDetail: allBankDetail ?? this.allBankDetail,
      allUsersList: allUsersList ?? this.allUsersList,
      allWithdrawRequestList: allWithdrawRequestList ?? this.allWithdrawRequestList,

      fetchDataApiStatus: fetchDataApiStatus ?? this.fetchDataApiStatus,
      actionApiStatus: actionApiStatus ?? this.actionApiStatus,
      successMsg: successMsg ?? this.successMsg,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    userData,
    bankDetail,
    allBankDetail,
    allUsersList,
    allWithdrawRequestList,

    fetchDataApiStatus,
    actionApiStatus,
    successMsg,
    error,
  ];
}