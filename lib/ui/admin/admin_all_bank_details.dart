import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/model/all_task_model/all_task_model.dart';
import 'package:r4everstore/data/model/bank_detail_model/bank_detail_model.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/ui/admin/add_task_screen.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class AdminAllBankDetails extends StatefulWidget {
  const AdminAllBankDetails({super.key});

  @override
  State<AdminAllBankDetails> createState() => _AdminAllBankDetailsState();
}

class _AdminAllBankDetailsState extends State<AdminAllBankDetails> {
  late ProfileBloc profileBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc = ProfileBloc(profileRepo: ProfileRepo());
    profileBloc.add(FetchAllBankDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bank Details", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => profileBloc,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
                  builder: (context, state) {
                    if(state.fetchDataApiStatus == ApiStatus.loading || state.fetchDataApiStatus == ApiStatus.initial){
                      return const LoadingWidget();
                    }
                    if(state.fetchDataApiStatus == ApiStatus.error){
                      return CustomErrorWidget(message: state.error);
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.allBankDetail.length,
                      itemBuilder: (context, index) {
                        BankDetail task = state.allBankDetail[index];
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1, 1),
                                    blurRadius: 3
                                )
                              ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(task.userId!.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                                    Text("Account No. : ${task.accountNo}"),
                                    Text("Bank Name : ${task.bankName}"),
                                    Text("Ifsc Code : ${task.ifscCode}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
