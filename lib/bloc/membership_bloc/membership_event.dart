part of 'membership_bloc.dart';

abstract class MembershipEvent extends Equatable {
  const MembershipEvent();

  @override
  List<Object?> get props => [];
}

class ChangePlanDetails extends MembershipEvent{
  final String? planName;
  final int? amount;
  const ChangePlanDetails({this.planName, this.amount});

  @override
  List<Object?> get props => [planName, amount];
}

class PurchasePlan extends MembershipEvent{}

class GetMyTeam extends MembershipEvent{}