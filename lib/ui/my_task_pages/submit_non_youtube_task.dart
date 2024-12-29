import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pod_player/pod_player.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/model/my_task_model/my_task_model.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';

class SubmitNonYoutubeTask extends StatefulWidget {
  final TaskWork taskWork;
  const SubmitNonYoutubeTask({super.key, required this.taskWork});

  @override
  State<SubmitNonYoutubeTask> createState() => _SubmitNonYoutubeTaskState();
}

class _SubmitNonYoutubeTaskState extends State<SubmitNonYoutubeTask> {
  late TaskBloc taskBloc;
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBloc = context.read<TaskBloc>();
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.taskWork.taskId!.link))..initialize().then((value) {
      controller.play();
      setState(() {});
    });
    controller.addListener(() {
      if(controller.value.position == controller.value.duration){
        taskBloc.add(UpdateTaskWork(taskWorkId: widget.taskWork.id, nonYoutubeTask: true));
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        body: BlocListener<TaskBloc, TaskState>(
          listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
          listener: (context, state) {
            if(state.actionApiStatus == ApiStatus.error){
              Navigator.pop(context);
              Utils.showFlushBar(state.error, FlushBarType.error, context);
            }
            if(state.actionApiStatus == ApiStatus.success){
              Navigator.pop(context);
              taskBloc.add(FetchMyTask());
              Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
            }
          },
          child: Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
        ),
      ),
    );
  }
}
