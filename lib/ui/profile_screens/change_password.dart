import 'package:flutter/material.dart';
import 'package:r4everstore/data/model/action_status_model/action_status_model.dart';
import 'package:r4everstore/data/network/api_services.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  ValueNotifier<ApiStatus> status = ValueNotifier(ApiStatus.initial);

  void changePassword() async{
    try{
      if(password.text.isEmpty) throw 'Fill the password';
      if(confirmPassword.text.isEmpty) throw 'Fill the confirm password';
      status.value = ApiStatus.loading;
      var res = await ApiServices().postRequest('auth/change_password', data: {
        'password': password.text,
        'confirmPassword': confirmPassword.text,
      });
      ActionStatusModel resp = ActionStatusModel.fromJson(res);
      if(resp.status){
        status.value = ApiStatus.success;
        Navigator.pop(context);
        Utils.showFlushBar(resp.message, FlushBarType.success, context);
      }else{
        Utils.showFlushBar(resp.message, FlushBarType.error, context);
      }
    }catch(e, s){
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      status.value = ApiStatus.error;
      Utils.showFlushBar(e.toString(), FlushBarType.error, context);
    }finally{
      status.value = ApiStatus.initial;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: password,
              title: 'Password',
              showTitle: false,
              onChanged: (value) {

              },
              isPassword: true,
            ),
            const SizedBox(height: 20),
            AppTextField(
              controller: confirmPassword,
              title: 'Change Password',
              showTitle: false,
              onChanged: (value) {

              },
              isPassword: true,
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: status,
              builder: (context, loadingStatus, child) {
              return AppButton(
                title: 'Change',
                loading: loadingStatus == ApiStatus.loading,
                onTap: () {
                  changePassword();
                },
              );
              },
            ),
            const SizedBox(height: 20),
            const Text("Note: 100/- will be the penalty for each time change of password"),
          ],
        ),
      ),
    );
  }
}
