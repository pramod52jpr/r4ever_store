part of 'membership_bloc.dart';

class MembershipState extends Equatable {
  final String planName;
  final int amount;
  final ApiStatus fetchDataApiStatus;
  final ApiStatus actionApiStatus;
  final String message;

  final List<UserModel> myTeam;

  const MembershipState({
    this.planName = '',
    this.amount = 0,
    this.fetchDataApiStatus = ApiStatus.initial,
    this.actionApiStatus = ApiStatus.initial,
    this.message = '',

    this.myTeam = const [],
  });

  MembershipState copyWith({
    String? planName,
    int? amount,
    ApiStatus? fetchDataApiStatus,
    ApiStatus? actionApiStatus,
    String? message,

    List<UserModel>? myTeam,
  }){
    return MembershipState(
      planName: planName ?? this.planName,
      amount: amount ?? this.amount,
      fetchDataApiStatus: fetchDataApiStatus ?? this.fetchDataApiStatus,
      actionApiStatus: actionApiStatus ?? this.actionApiStatus,
      message: message ?? this.message,
      myTeam: myTeam ?? this.myTeam,
    );
  }

  @override
  List<Object?> get props => [
    planName,
    amount,
    fetchDataApiStatus,
    actionApiStatus,
    message,
    myTeam,
  ];
}