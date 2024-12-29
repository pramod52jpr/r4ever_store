import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/data/repository/auth_repo.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late AuthBloc authBloc;

  // ValueNotifier<bool> loading = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = AuthBloc(authRepo: AuthRepo());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authBloc,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  Center(child: Image.asset(Images.logo, scale: 15,)),
                  const SizedBox(height: 30),
                  const Text(
                    "Signup",
                    style: TextStyle(
                        fontSize: 30,
                        // color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) => previous.referralId != current.referralId,
                    builder: (context, state) {
                      return AppTextField(
                        title: "Referral Id",
                        showTitle: false,
                        initialValue: state.referralId,
                        onChanged: (value) {
                          authBloc.add(ChangeAuthState(referralId: value));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) => previous.fullName != current.fullName,
                    builder: (context, state) {
                      return AppTextField(
                        title: "Full Name",
                        showTitle: false,
                        initialValue: state.fullName,
                        onChanged: (value) {
                          authBloc.add(ChangeAuthState(fullName: value));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) => previous.mobileNo != current.mobileNo,
                    builder: (context, state) {
                      return AppTextField(
                        title: "Mobile No.",
                        showTitle: false,
                        initialValue: state.mobileNo,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          authBloc.add(ChangeAuthState(mobileNo: value));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: "Password",
                    showTitle: false,
                    isPassword: true,
                    onChanged: (value) {
                      authBloc.add(ChangeAuthState(password: value));
                    },
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      BlocListener<AuthBloc, AuthState>(
                        listenWhen: (previous, current) => previous.registerApiStatus != current.registerApiStatus,
                        listener: (context, state) {
                          if(state.registerApiStatus == ApiStatus.error){
                            // loading.value = false;
                            Utils.showFlushBar(state.error, FlushBarType.error, context);
                          }
                          if(state.registerApiStatus == ApiStatus.success){
                            // loading.value = false;
                            // if(state.otp.isEmpty){
                            //   showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return VerifyMobileDialog(authBloc: authBloc);
                            //     },
                            //   );
                            // }else{
                            //   Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
                            // }
                            Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
                            Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
                          }
                        },
                        child: BlocBuilder<AuthBloc, AuthState>(
                          buildWhen: (previous, current) => previous.registerApiStatus != current.registerApiStatus,
                          builder: (context, state) {
                            return Expanded(
                              child: AppButton(
                                title: "Register",
                                color: Colors.green,
                                color1: Colors.green,
                                loading: state.registerApiStatus == ApiStatus.loading,
                                onTap: () {
                                  // loading.value = true;
                                  authBloc.add(const RegisterUser());
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Already a member ?", style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      AppButton(
                        title: "Login",
                        color: K.secondaryColor,
                        color1: K.secondaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.loginScreen);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class VerifyMobileDialog extends StatefulWidget {
  final AuthBloc authBloc;
  const VerifyMobileDialog({super.key, required this.authBloc});

  @override
  State<VerifyMobileDialog> createState() => _VerifyMobileDialogState();
}

class _VerifyMobileDialogState extends State<VerifyMobileDialog> {

  ValueNotifier<bool> loading = ValueNotifier(false);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.authBloc.add(ChangeAuthState(otp: ""));
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(child: Text("Enter Otp", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
            const SizedBox(height: 30),
            Material(
              child: Pinput(
                 length: 6,
                 onChanged: (value) {
                   widget.authBloc.add(ChangeAuthState(otp: value));
                 },
               ),
            ),
            const SizedBox(height: 30),
            ValueListenableBuilder(
              valueListenable: loading,
              builder: (context, load, child) {
                return AppButton(
                  title: "Verify",
                  color: Colors.green,
                  color1: Colors.green,
                  loading: load,
                  onTap: () async{
                    loading.value = true;
                    widget.authBloc.add(const RegisterUser(verifyOtp: true));
                    await Future.delayed(Duration(seconds: 3), () {
                      loading.value = false;
                    },);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
