import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/data/repository/auth_repo.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthBloc authBloc;

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
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) => previous.mobileNo != current.mobileNo,
                    builder: (context, state) {
                      return AppTextField(
                        title: "Mobile No.",
                        showTitle: false,
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
                  // const SizedBox(height: 10),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, RoutesName.forgotPassScreen);
                  //     },
                  //     child: const Text(
                  //       "Forgot Password ?",
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w600
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      BlocListener<AuthBloc, AuthState>(
                        listenWhen: (previous, current) => previous.loginApiStatus != current.loginApiStatus,
                        listener: (context, state) {
                          if(state.loginApiStatus == ApiStatus.error){
                            Utils.showFlushBar(state.error, FlushBarType.error, context);
                          }
                          if(state.loginApiStatus == ApiStatus.success){
                            Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeBar, (route) => false);
                            Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
                          }
                        },
                        child: BlocBuilder<AuthBloc, AuthState>(
                          buildWhen: (previous, current) => previous.loginApiStatus != current.loginApiStatus,
                          builder: (context, state) {
                            return Expanded(
                              child: AppButton(
                                title: "Login",
                                color: Colors.green,
                                color1: Colors.green,
                                loading: state.loginApiStatus == ApiStatus.loading,
                                onTap: () {
                                  authBloc.add(LoginUser());
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
                      const Text("Create an account", style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      AppButton(
                        title: "Signup",
                        color: K.secondaryColor,
                        color1: K.secondaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.registerScreen);
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
