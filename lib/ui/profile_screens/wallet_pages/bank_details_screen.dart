import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class BankDetailsScreen extends StatefulWidget {
  final AuthBloc authBloc;
  const BankDetailsScreen({super.key, required this.authBloc});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  late ProfileBloc profileBloc;
  ValueNotifier<bool> first = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc = ProfileBloc(profileRepo: ProfileRepo());
    profileBloc.add(FetchBankDetails());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update Bank Details", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocListener<ProfileBloc, ProfileState>(
            listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
            listener: (context, state) {
              if(state.actionApiStatus == ApiStatus.error){
                Utils.showFlushBar(state.error, FlushBarType.error, context);
              }
              if(state.actionApiStatus == ApiStatus.success){
                widget.authBloc.add(FetchWalletData());
                Navigator.pop(context);
                Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
              }
            },
            child: BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
              builder: (context, state) {
                if(state.fetchDataApiStatus == ApiStatus.loading || state.fetchDataApiStatus == ApiStatus.initial){
                  return const LoadingWidget();
                }
                if(state.fetchDataApiStatus == ApiStatus.error){
                  return CustomErrorWidget(message: state.error);
                }
                if(state.bankDetail!.accountNo.isEmpty && state.bankDetail!.ifscCode.isEmpty && state.bankDetail!.bankName.isEmpty){
                  first.value = true;
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: first,
                          builder: (context, firstTime, child) {
                            if(firstTime){
                              return const Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text("Welcome! Fill the correct bank details. 500/- will be the penalty after first time update of bank details", style: TextStyle(color: Colors.red)),
                                  SizedBox(height: 20),
                                ],
                              );
                            }
                            return const Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("Note: 500/- will be the penalty for each time update of bank details", style: TextStyle(color: Colors.red)),
                                SizedBox(height: 20),
                              ],
                            );
                        },),
                        AppTextField(
                          title: "Account Number",
                          showTitle: false,
                          initialValue: state.bankDetail!.accountNo,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            profileBloc.add(UpdateBankData(accountNo: value));
                          },
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          title: "Bank Name",
                          showTitle: false,
                          initialValue: state.bankDetail!.bankName,
                          onChanged: (value) {
                            profileBloc.add(UpdateBankData(bankName: value));
                          },
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          title: "Ifsc Code",
                          showTitle: false,
                          initialValue: state.bankDetail!.ifscCode,
                          onChanged: (value) {
                            profileBloc.add(UpdateBankData(ifscCode: value));
                          },
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                          builder: (context, state) {
                            return AppButton(
                              title: "Update",
                              loading: state.actionApiStatus == ApiStatus.loading,
                              onTap: () {
                                profileBloc.add(UpdateBankDetails());
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
