import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/ui/admin/admin_all_bank_details.dart';
import 'package:r4everstore/ui/admin/admin_all_users.dart';
import 'package:r4everstore/ui/admin/admin_imp_message.dart';
import 'package:r4everstore/ui/admin/admin_terms_conditions.dart';
import 'package:r4everstore/ui/admin/festival_holidays_list.dart';
import 'package:r4everstore/ui/admin/plans_setting.dart';
import 'package:r4everstore/ui/admin/purchase_plan_requests.dart';
import 'package:r4everstore/ui/admin/upload_payment_qr.dart';
import 'package:r4everstore/ui/admin/withdraw_requests.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Panel", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminAllUsers()));
              },
              title: const Text("Users"),
              leading: const CircleAvatar(
                child: Icon(PhosphorIcons.users),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.adminAllTasks);
              },
              title: const Text("Tasks"),
              leading: const CircleAvatar(
                child: Icon(Icons.task_alt_outlined),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminAllBankDetails()));
              },
              title: const Text("Bank Details"),
              leading: const CircleAvatar(
                child: Icon(PhosphorIcons.bank),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FestivalHolidaysList()));
              },
              title: const Text("Holidays"),
              leading: const CircleAvatar(
                child: Icon(Icons.date_range_outlined),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawRequests()));
              },
              title: const Text("Withdraw Request"),
              leading: const CircleAvatar(
                child: Icon(PhosphorIcons.wallet),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadQr()));
              },
              title: const Text("Upload Qr Code"),
              leading: const CircleAvatar(
                child: Icon(PhosphorIcons.qr_code),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PurchasePlanRequests()));
              },
              title: const Text("Purchase Plan Request"),
              leading: const CircleAvatar(
                child: Icon(Icons.currency_rupee),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlansSetting()));
              },
              title: const Text("Plans Setting"),
              leading: const CircleAvatar(
                child: Icon(PhosphorIcons.planet),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminTermsConditions()));
              },
              title: const Text("Terms & conditions"),
              leading: const CircleAvatar(
                child: Icon(PhosphorIcons.terminal),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminImpMessage()));
              },
              title: const Text("Important Notification"),
              leading: const CircleAvatar(
                child: Icon(PhosphorIcons.messenger_logo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
