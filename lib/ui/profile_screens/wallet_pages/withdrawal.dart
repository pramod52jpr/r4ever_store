import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  late AuthBloc authBloc;

  List<int> moneyList = [250, 500, 1000, 2000, 4000, 6000, 10000, 20000, 50000];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    authBloc.add(const ChangeAmount(amount: ''));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              // Align(
              //   alignment: Alignment.centerRight,
              //     child: Text("Min. withdrawal : 250/-"),
              // ),
              // const SizedBox(height: 10),
              // AppTextField(
              //   title: "Amount",
              //   showTitle: false,
              //   inputFormatters: [
              //     FilteringTextInputFormatter.digitsOnly,
              //     LengthLimitingTextInputFormatter(6),
              //   ],
              //   keyboardType: TextInputType.number,
              //   onChanged: (value) {
              //     authBloc.add(ChangeAmount(amount: value));
              //   },
              // ),
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) => previous.amount != current.amount,
                builder: (context, state) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  children: moneyList.map((e) => GestureDetector(
                    onTap: () {
                      authBloc.add(ChangeAmount(amount: e.toString()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: state.amount == e.toString() ? Colors.black : null,
                        border: Border.all(width: 0.5, color: state.amount == e.toString() ? Colors.white : Colors.black),
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: Text('$e/-', style: TextStyle(color: state.amount == e.toString() ? Colors.white : null)),
                    ),
                  )).toList(),
                );
              },),
              const SizedBox(height: 25),
              BlocListener<AuthBloc, AuthState>(
                listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                listener: (context, state) {
                  if(state.actionApiStatus == ApiStatus.error){
                    Utils.showFlushBar(state.message, FlushBarType.error, context);
                  }
                  if(state.actionApiStatus == ApiStatus.success){
                    authBloc.add(FetchWalletData());
                    Navigator.pop(context);
                    Utils.showFlushBar(state.message, FlushBarType.success, context);
                  }
                },
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                  builder: (context, state) {
                    return AppButton(
                      title: "Withdraw",
                      loading: state.actionApiStatus == ApiStatus.loading,
                      onTap: () {
                        authBloc.add(WithdrawAmountApi());
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
