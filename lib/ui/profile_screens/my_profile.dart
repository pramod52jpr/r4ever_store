import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/utils/constant.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_dropdown.dart';
import 'package:r4everstore/widgets/app_text_field.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late ProfileBloc profileBloc;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc = ProfileBloc(profileRepo: ProfileRepo());
    profileBloc.add(FetchProfileData());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child:  Scaffold(
        appBar: AppBar(
          title: const Text("Update Profile", style: TextStyle(fontWeight: FontWeight.bold)),
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
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 10),
                        AppTextField(
                          title: "Full Name",
                          showTitle: false,
                          initialValue: state.userData!.name,
                          onChanged: (value) {
                            profileBloc.add(UpdateUserData(name: value));
                          },
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          title: "Age",
                          showTitle: false,
                          keyboardType: TextInputType.number,
                          initialValue: state.userData!.age,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            profileBloc.add(UpdateUserData(age: value));
                          },
                        ),
                        const SizedBox(height: 20),
                        AppDropdown(
                          items: const [
                            DropdownMenuItem(value: "male", child: Text("Male")),
                            DropdownMenuItem(value: "female", child: Text("Female")),
                          ],
                          onChanged: (value) {
                            profileBloc.add(UpdateUserData(gender: value));
                          },
                          value: state.userData!.gender.isEmpty ? null : state.userData!.gender,
                          title: "Gender",
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          title: "Work",
                          showTitle: false,
                          initialValue: state.userData!.work,
                          onChanged: (value) {
                            profileBloc.add(UpdateUserData(work: value));
                          },
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          title: "Whatsapp Number",
                          showTitle: false,
                          initialValue: state.userData!.whatsappNo,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) {
                            profileBloc.add(UpdateUserData(whatsappNo: value));
                          },
                        ),
                        const SizedBox(height: 20),
                        AppTextField(
                          title: "Location",
                          showTitle: false,
                          initialValue: state.userData!.location,
                          onChanged: (value) {
                            profileBloc.add(UpdateUserData(location: value));
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
                                profileBloc.add(UpdateProfileData());
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),
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
