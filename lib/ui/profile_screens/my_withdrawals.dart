import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:intl/intl.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/data/model/all_withdraw_requests_model/all_withdraw_request_model.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class MyWithdrawals extends StatefulWidget {
  const MyWithdrawals({super.key});

  @override
  State<MyWithdrawals> createState() => _MyWithdrawalsState();
}

class _MyWithdrawalsState extends State<MyWithdrawals> {
  late ProfileBloc profileBloc;

  int? loadingIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc = ProfileBloc(profileRepo: ProfileRepo());
    profileBloc.add(FetchMyWithdrawalRequests());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw Requests", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
          listener: (context, state) {
            if(state.actionApiStatus == ApiStatus.error){
              Utils.showFlushBar(state.error, FlushBarType.error, context);
            }
            if(state.actionApiStatus == ApiStatus.success){
              profileBloc.add(FetchAllWithdrawRequest());
              Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
            builder: (context, state) {
              if(state.fetchDataApiStatus == ApiStatus.loading){
                return const LoadingWidget();
              }
              if(state.fetchDataApiStatus == ApiStatus.error){
                return CustomErrorWidget(message: state.error);
              }
              return ListView.builder(
                itemCount: state.allWithdrawRequestList.length,
                itemBuilder: (context, index) {
                  WithdrawModel withdrawModel = state.allWithdrawRequestList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text(withdrawModel.userId!.name, style: const TextStyle(fontWeight: FontWeight.bold)), // Replace with actual user name
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.phone, size: 16),
                              const SizedBox(width: 4),
                              Text(withdrawModel.userId!.phone), // Replace with actual phone
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.currency_rupee, size: 16),
                              const SizedBox(width: 4),
                              Text(withdrawModel.amount.toString()), // Replace with actual gender
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.date_range_outlined, size: 16),
                              const SizedBox(width: 4),
                              Text(DateFormat.yMMMMd().format(DateTime.parse(withdrawModel.createdAt)))
                            ],
                          ),
                          // const Text("Bank Details", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          // Row(
                          //   children: [
                          //     const Icon(PhosphorIcons.bank, size: 16),
                          //     const SizedBox(width: 4),
                          //     const Text("Name: ", style: TextStyle(fontWeight: FontWeight.bold)),
                          //     Text("${withdrawModel.bankDetails?.bankName}"),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     const Icon(PhosphorIcons.bank, size: 16),
                          //     const SizedBox(width: 4),
                          //     const Text("Acc. No.: ", style: TextStyle(fontWeight: FontWeight.bold)),
                          //     Text("${withdrawModel.bankDetails?.accountNo}"),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     const Icon(PhosphorIcons.bank, size: 16),
                          //     const SizedBox(width: 4),
                          //     const Text("Ifsc code: ", style: TextStyle(fontWeight: FontWeight.bold)),
                          //     Text("${withdrawModel.bankDetails?.ifscCode}"),
                          //   ],
                          // ),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // if(!withdrawModel.success){
                              //   loadingIndex = index;
                              //   profileBloc.add(SendMoneySuccess(withdrawId: withdrawModel.id));
                              // }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  // border: Border.all(color: withdrawModel.success ? Colors.transparent : Colors.grey, width: 0.5),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: BlocBuilder<ProfileBloc, ProfileState>(
                                buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                                builder: (context, state) {
                                  if(state.actionApiStatus == ApiStatus.loading && loadingIndex == index){
                                    return const SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Center(child: CircularProgressIndicator(strokeWidth: 1,)),
                                    );
                                  }
                                  return Text(withdrawModel.success ? "Success" : "Pending", style: TextStyle(color: withdrawModel.success ? Colors.green : Colors.black));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
