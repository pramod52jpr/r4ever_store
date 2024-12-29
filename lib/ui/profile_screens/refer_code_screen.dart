import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/data/repository/auth_repo.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class ReferCodeScreen extends StatefulWidget {
  const ReferCodeScreen({super.key});

  @override
  State<ReferCodeScreen> createState() => _ReferCodeScreenState();
}

class _ReferCodeScreenState extends State<ReferCodeScreen> {
  late AuthBloc authBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = AuthBloc(authRepo: AuthRepo());
    authBloc.add(GetReferCodeApi());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refer & Earn", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => authBloc,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
              builder: (context, state) {
                if(state.fetchDataApiStatus == ApiStatus.loading || state.fetchDataApiStatus == ApiStatus.initial){
                  return const LoadingWidget();
                }
                if(state.fetchDataApiStatus == ApiStatus.error){
                  return CustomErrorWidget(message: state.message);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // const SizedBox(height: 100),
                    Image.asset(Images.referAndEarn),
                    const SizedBox(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: state.referCode));
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [3],
                          radius: const Radius.circular(5),
                          strokeWidth: 0.5,
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(state.referCode),
                              const SizedBox(width: 10),
                              const Icon(Icons.copy, size: 15)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Invite Friends & Earn Rewards!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Share the app with your friends and enjoy rewards together. Every time someone signs up using your referral link, you earn exciting bonuses! Just share your unique link below, and let the rewards roll in.",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "How It Works:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "1. Share your referral link with friends.\n"
                          "2. Earn rewards when they sign up.\n"
                          "3. Enjoy exclusive benefits together!",
                      style: TextStyle(fontSize: 15),
                    ),
                    // const Spacer(),
                    // AppButton(
                    //   title: "Invite & Earn",
                    //   onTap: () {
                    //
                    //   },
                    // )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
