import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mime/mime.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/model/my_task_model/my_task_model.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/upload_image.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmitTask extends StatefulWidget {
  final TaskWork taskWork;
  const SubmitTask({super.key, required this.taskWork});

  @override
  State<SubmitTask> createState() => _SubmitTaskState();
}

class _SubmitTaskState extends State<SubmitTask> with WidgetsBindingObserver {
  late TaskBloc taskBloc;
  TextRecognizer textRecognizer = TextRecognizer();
  ValueNotifier<int> timeCount = ValueNotifier(30);
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBloc = context.read<TaskBloc>();
    taskBloc.add(const ChangeSubscribedStatus(subscribed: false));
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    taskBloc.add(const ChangeTaskImage(taskImage: ''));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused){
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(timeCount.value > 0){
          timeCount.value--;
          if(timeCount.value == 0) timer.cancel();
        }else{
          timer.cancel();
        }
      });
    }else{
      if(timer != null){
        timer!.cancel();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocListener<TaskBloc, TaskState>(
          listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
          listener: (context, state) {
            if(state.actionApiStatus == ApiStatus.error){
              Utils.showFlushBar(state.error, FlushBarType.error, context);
            }
            if(state.actionApiStatus == ApiStatus.success){
              Navigator.pop(context);
              taskBloc.add(FetchMyTask());
              Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Click on the link", style: TextStyle(fontSize: 18)),
                      ValueListenableBuilder(
                          valueListenable: timeCount,
                          builder: (context, time, child) {
                            return Text("Time : 00:${time.toString().padLeft(2, '0')}");
                          },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async{
                      await launchUrl(Uri.parse(widget.taskWork.taskId!.link));
                    },
                    child: Text(widget.taskWork.taskId!.link, style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskBloc, TaskState>(
                    buildWhen: (previous, current) => previous.subscribed != current.subscribed,
                    builder: (context, subscribeState) {
                      return Row(
                        children: [
                          const Text("Subscribed"),
                          const SizedBox(width: 10),
                          if(subscribeState.subscribed)
                            const Icon(Icons.check_circle, color: Colors.green,)
                          else
                            const Icon(Icons.cancel, color: Colors.red)
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskBloc, TaskState>(
                    buildWhen: (previous, current) => previous.taskImage != current.taskImage,
                    builder: (context, state) {
                      return UploadImage(
                        imageFile: state.taskImage,
                        onTap: () async{
                          if(timeCount.value <= 0){
                            File? image = await Utils.pickImage();
                            taskBloc.add(ChangeTaskImage(taskImage: image));
                            RecognizedText recognizedText = await textRecognizer.processImage(InputImage.fromFile(image!));
                            String line = '';
                            for(TextBlock textBlock in recognizedText.blocks){
                              for(TextLine textLine in textBlock.lines){
                                line+=textLine.text;
                              }
                            }
                            if((!line.contains('Subscribe') && line.contains('Comments')) || ((line.contains('Subscribed') || !line.contains('Subscribe') && line.contains('Share')))){
                              taskBloc.add(const ChangeSubscribedStatus(subscribed: true));
                            }else{
                              taskBloc.add(const ChangeSubscribedStatus(subscribed: false));
                            }
                          }else{
                            Utils.showFlushBar("Watch video at least one minute", FlushBarType.error, context);
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskBloc, TaskState>(
                    buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                    builder: (context, state) {
                      return AppButton(
                        title: "Upload",
                        loading: state.actionApiStatus == ApiStatus.loading,
                        onTap: () {
                          taskBloc.add(UpdateTaskWork(taskWorkId: widget.taskWork.id));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
