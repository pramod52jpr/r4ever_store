import 'package:flutter/material.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              Center(child: Image.asset(Images.logo, scale: 15,)),
              const SizedBox(height: 30),
              const Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              AppTextField(
                title: "Member ID",
                showTitle: false,
                onChanged: (value) {

                },
              ),
              const SizedBox(height: 20),
              AppButton(
                title: "Submit",
                color: Colors.purple,
                color1: Colors.purple,
                onTap: () {
                  // Navigator.pushNamed(context, RoutesName.registerScreen);
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      title: "Login",
                      color: K.indigo,
                      color1: K.indigo,
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.loginScreen);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppButton(
                      title: "Signup",
                      color: K.indigo,
                      color1: K.indigo,
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.registerScreen);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
