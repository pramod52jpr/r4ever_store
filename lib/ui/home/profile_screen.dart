import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/services/session.dart';
import 'package:r4everstore/ui/profile_screens/change_password.dart';
import 'package:r4everstore/ui/profile_screens/my_withdrawals.dart';
import 'package:r4everstore/ui/profile_screens/refer_code_screen.dart';
import 'package:r4everstore/ui/profile_screens/terms_and_conditions.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/widgets/header_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  // color: K.primaryColor
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(Images.logo, height: 100),
                    const SizedBox(height: 20),
                    // Text(Session.userData!.referCode, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(Session.userData!.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    // GridView(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 70, crossAxisSpacing: 20),
                    //   children: [
                    //     gridTab(title: "Income Balance", content: "0 INR"),
                    //     gridTab(title: "Package", content: "0 INR"),
                    //     gridTab(title: "Identity", content: "0 INR"),
                    //     gridTab(title: "Fund Balance", content: "0 INR"),
                    //     gridTab(title: "Total Income", content: "0 INR"),
                    //     gridTab(title: "Fund Received", content: "0 INR"),
                    //   ],
                    // )
                  ],
                ),
              ),
              // GridView(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   padding: const EdgeInsets.all(10),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 80, crossAxisSpacing: 10, mainAxisSpacing: 10),
              //   children: [
              //     gridTab2(title: "Yesterday's earnings", content: "0"),
              //     gridTab2(title: "Today's earnings", content: "0"),
              //     gridTab2(title: "Total revenue", content: "0"),
              //     gridTab2(title: "Today subordinate task rebates", content: "0"),
              //     gridTab2(title: "Complete the task today", content: "0"),
              //     gridTab2(title: "Today's remaining tasks", content: "0"),
              //     gridTab2(title: "Level income Like L1,L2,L3,L4", content: "0"),
              //     gridTab2(title: "Subordinate task rebates", content: "0"),
              //     gridTab2(title: "Recommended rebate", content: "0"),
              //   ],
              // ),
              const SizedBox(height: 10),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  if(Session.isAdmin)
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.adminPanel);
                    },
                    title: const Text("Admin Panel"),
                    leading: const CircleAvatar(
                      child: Icon(PhosphorIcons.user),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.myProfile);
                    },
                    title: const Text("My Profile"),
                    leading: const CircleAvatar(
                      child: Icon(PhosphorIcons.user),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.walletScreen);
                    },
                    title: const Text("Wallet"),
                    leading: const CircleAvatar(
                      child: Icon(PhosphorIcons.bank),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyWithdrawals()));
                    },
                    title: const Text("My Withdrawals"),
                    leading: const CircleAvatar(
                      child: Icon(PhosphorIcons.bank),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePassword()));
                    },
                    title: const Text("Change Password"),
                    leading: const CircleAvatar(
                      child: Icon(PhosphorIcons.lock),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ReferCodeScreen()));
                    },
                    title: const Text("Refer & Earn"),
                    leading: const CircleAvatar(
                      child: Icon(Icons.currency_rupee),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsAndConditions()));
                    },
                    title: const Text("Terms & Conditions"),
                    leading: const CircleAvatar(
                      child: Icon(Icons.help),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Session.clearData();
                      Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
                    },
                    title: const Text("Logout"),
                    leading: const CircleAvatar(
                      child: Icon(Icons.logout),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget gridTab({required String title, required String content}){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      Text(content, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15))
    ],
  );
}

Widget gridTab2({required String title, required String content}){
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17, height: 1), textAlign: TextAlign.center,),
        Text(content, style: const TextStyle(color: Colors.black, fontSize: 15))
      ],
    ),
  );
}