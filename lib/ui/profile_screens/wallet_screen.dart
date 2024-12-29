import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:r4everstore/bloc/auth_bloc/auth_bloc.dart';
import 'package:r4everstore/ui/profile_screens/wallet_pages/bank_details_screen.dart';
import 'package:r4everstore/ui/profile_screens/wallet_pages/recharge.dart';
import 'package:r4everstore/ui/profile_screens/wallet_pages/withdrawal.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late AuthBloc authBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc = context.read<AuthBloc>();
    authBloc.add(FetchWalletData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
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
                  const Text("My Balance", style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      const Icon(Icons.currency_rupee),
                      Text("${state.wallet}", style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // customTile(
                  //   title: "Recharge",
                  //   icon: PhosphorIcons.money,
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => const RechargeScreen()));
                  //   },
                  // ),
                  customTile(
                    title: "Withdrawal",
                    icon: Icons.currency_rupee,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawalScreen()));
                    },
                  ),
                  customTile(
                    title: "Wallet Bank Details",
                    icon: PhosphorIcons.bank,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsScreen(authBloc: authBloc)));
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget customTile({required String title, required IconData icon, required VoidCallback onTap}){
  return InkWell(
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(icon),
          ),
          const SizedBox(width: 15),
          Text(title, style: const TextStyle(fontSize: 17))
        ],
      ),
    ),
  );
}