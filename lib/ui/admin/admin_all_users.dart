import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/profile_bloc/profile_bloc.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/data/repository/profile_repo.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class AdminAllUsers extends StatefulWidget {
  const AdminAllUsers({super.key});

  @override
  State<AdminAllUsers> createState() => _AdminAllUsersState();
}

class _AdminAllUsersState extends State<AdminAllUsers> {
  late ProfileBloc profileBloc;

  int? loadingIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc = ProfileBloc(profileRepo: ProfileRepo());
    profileBloc.add(FetchAllUsersDetails());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
          listener: (context, state) {
            if(state.actionApiStatus == ApiStatus.error){
              Utils.showFlushBar(state.error, FlushBarType.error, context);
            }
            if(state.actionApiStatus == ApiStatus.success){
              profileBloc.add(FetchAllUsersDetails());
              Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
            builder: (context, state) {
              if(state.fetchDataApiStatus == ApiStatus.loading){
                return const LoadingWidget();
              }
              if(state.fetchDataApiStatus == ApiStatus.error){
                return CustomErrorWidget(message: state.error);
              }
              return ListView.builder(
                itemCount: state.allUsersList.length,
                itemBuilder: (context, index) {
                  UserModel userModel = state.allUsersList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      title: Text(userModel.name), // Replace with actual user name
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.phone, size: 16),
                              const SizedBox(width: 4),
                              Text(userModel.phone), // Replace with actual phone
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.person_outline, size: 16),
                              const SizedBox(width: 4),
                              Text(userModel.gender), // Replace with actual gender
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 16),
                              const SizedBox(width: 4),
                              Text(userModel.location), // Replace with actual location
                            ],
                          ),
                          if(userModel.plan != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 5),
                                const Text('Plan details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                Row(
                                  children: [
                                    const Icon(Icons.next_plan, size: 16),
                                    const SizedBox(width: 4),
                                    Text(userModel.plan!.planName.toUpperCase()), // Replace with actual location
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.date_range_outlined, size: 16),
                                    const SizedBox(width: 4),
                                    Text(userModel.plan!.expiry), // Replace with actual location
                                  ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.currency_rupee, size: 16),
                                      const SizedBox(width: 4),
                                      Text(userModel.plan!.amount.toString()), // Replace with actual location
                                    ],
                                  ),
                              ],
                            )
                        ],
                      ),
                      trailing: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              loadingIndex = index;
                              profileBloc.add(BlockUnblockUser(userId: userModel.id, block: !userModel.blocked));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey, width: 0.5),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: BlocBuilder<ProfileBloc, ProfileState>(
                                buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                                builder: (context, state) {
                                  if(state.actionApiStatus == ApiStatus.loading && loadingIndex == index){
                                    return const SizedBox(
                                      height: 15,
                                        width: 15,
                                        child: Center(child: CircularProgressIndicator(strokeWidth: 1,)),
                                    );
                                  }
                                  return Text(userModel.blocked ? "Unblock" : "Block");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
