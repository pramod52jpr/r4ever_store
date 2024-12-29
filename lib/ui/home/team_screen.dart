import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/membership_bloc/membership_bloc.dart';
import 'package:r4everstore/data/model/view_profile_model/view_profile_model.dart';
import 'package:r4everstore/data/repository/membership_repo.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/images.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/custom_video_player.dart';
import 'package:r4everstore/widgets/header_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  late MembershipBloc membershipBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    membershipBloc = MembershipBloc(membershipRepo: MembershipRepo());
    membershipBloc.add(GetMyTeam());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => membershipBloc,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MembershipBloc, MembershipState>(
            buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
            builder: (context, state) {
              if (state.fetchDataApiStatus == ApiStatus.loading ||
                  state.fetchDataApiStatus == ApiStatus.initial) {
                return const LoadingWidget();
              }
              if (state.fetchDataApiStatus == ApiStatus.error) {
                return CustomErrorWidget(message: state.message);
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Column(
                    children: [
                      const Text("Team", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23)),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.myTeam.length,
                        itemBuilder: (context, index) {
                          UserModel userModel = state.myTeam[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: ListTile(
                              title: Text(userModel.name), // Replace with actual user name
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.leaderboard_outlined, size: 16),
                                      const SizedBox(width: 4),
                                      Text("Level ${userModel.level}"), // Replace with actual phone
                                    ],
                                  ),
                                  if(userModel.gender.isNotEmpty)
                                  Row(
                                    children: [
                                      const Icon(Icons.person_outline, size: 16),
                                      const SizedBox(width: 4),
                                      Text(userModel.gender), // Replace with actual gender
                                    ],
                                  ),
                                  if(userModel.location.isNotEmpty)
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on_outlined, size: 16),
                                      const SizedBox(width: 4),
                                      Text(userModel.location), // Replace with actual location
                                    ],
                                  ),
                                ],
                              ),
                              // trailing: Column(
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //         // loadingIndex = index;
                              //         // profileBloc.add(BlockUnblockUser(userId: userModel.id, block: !userModel.blocked));
                              //       },
                              //       child: Container(
                              //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              //         decoration: BoxDecoration(
                              //             border: Border.all(color: Colors.grey, width: 0.5),
                              //             borderRadius: BorderRadius.circular(5)
                              //         ),
                              //         child: BlocBuilder<ProfileBloc, ProfileState>(
                              //           buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                              //           builder: (context, state) {
                              //             if(state.actionApiStatus == ApiStatus.loading && loadingIndex == index){
                              //               return const SizedBox(
                              //                 height: 15,
                              //                 width: 15,
                              //                 child: Center(child: CircularProgressIndicator(strokeWidth: 1,)),
                              //               );
                              //             }
                              //             return Text(userModel.blocked ? "Unblock" : "Block");
                              //           },
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
