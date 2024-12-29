import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/model/my_task_model/my_task_model.dart';
import 'package:r4everstore/ui/my_task_pages/submit_non_youtube_task.dart';
import 'package:r4everstore/ui/my_task_pages/submit_task.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/header_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TaskBloc taskBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBloc = context.read<TaskBloc>();
    taskBloc.add(FetchMyTask());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    taskBloc.add(BackToInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const HeaderWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("My Task", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 10),
                    Expanded(
                      child: BlocBuilder<TaskBloc, TaskState>(
                        buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
                        builder: (context, state) {
                          if(state.fetchDataApiStatus == ApiStatus.loading || state.fetchDataApiStatus == ApiStatus.initial){
                            return const LoadingWidget();
                          }
                          if(state.fetchDataApiStatus == ApiStatus.error){
                            return CustomErrorWidget(message: state.error);
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.myTaskWork.length,
                            itemBuilder: (context, index) {
                              TaskWork task = state.myTaskWork[index];
                              return GestureDetector(
                                onTap: () {
                                  if(!task.completed){
                                    if(DateTime.now().hour < 8 || DateTime.now().hour >= 21){
                                      Utils.showFlushBar('Add task time is 8 AM - 9 PM', FlushBarType.error, context);
                                      return;
                                    }
                                    if(task.taskId!.category == 'youtube'){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubmitTask(taskWork: task)));
                                    }else{
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubmitNonYoutubeTask(taskWork: task)));
                                    }
                                  }else{
                                    Utils.showFlushBar('Task Completed', FlushBarType.warn, context);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(1, 1),
                                            blurRadius: 3
                                        )
                                      ]
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Link : ${task.taskId!.link}", style: const TextStyle(fontSize: 15),),
                                            Text("Category : ${task.taskId!.category == 'localBusiness' ? "Local Business" : task.taskId!.category == 'business' ? "Business" : "Youtube"}")
                                          ],
                                        ),
                                      ),
                                      if(task.completed)
                                      const Icon(Icons.check_circle, color: Colors.green)
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
