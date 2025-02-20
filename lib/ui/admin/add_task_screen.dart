import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/model/all_task_model/all_task_model.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/app_button.dart';
import 'package:r4everstore/widgets/app_dropdown.dart';
import 'package:r4everstore/widgets/app_text_field.dart';
import 'package:r4everstore/widgets/upload_image.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskModel? taskModel;
  const AddTaskScreen({super.key, this.taskModel});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TaskBloc taskBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBloc = context.read<TaskBloc>();
    if(widget.taskModel != null){
      taskBloc.add(ChangeTaskData(
          category: widget.taskModel!.category,
      ));
      if(widget.taskModel!.category == 'youtube'){
        taskBloc.add(ChangeTaskData(
          link: widget.taskModel!.link,
        ));
      }else{
        taskBloc.add(ChangeTaskData(
          link: '',
          uploadVideoFile: widget.taskModel!.link,
        ));
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    taskBloc.add(EmptyTaskData());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskModel != null ? "Update Task" : "Add Task", style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BlocListener<TaskBloc, TaskState>(
              listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
              listener: (context, state) {
                if(state.actionApiStatus == ApiStatus.error){
                  Utils.showFlushBar(state.error, FlushBarType.error, context);
                }
                if(state.actionApiStatus == ApiStatus.success){
                  Navigator.pop(context);
                  taskBloc.add(const FetchAllTaskData());
                  Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  BlocBuilder<TaskBloc, TaskState>(
                    buildWhen: (previous, current) => previous.taskData?.category != current.taskData?.category,
                    builder: (context, state) {
                      return AppDropdown(
                        items: const [
                          DropdownMenuItem(value: "youtube", child: Text("Youtube")),
                          DropdownMenuItem(value: "business", child: Text("Business")),
                          DropdownMenuItem(value: "localBusiness", child: Text("Local Business")),
                        ],
                        value: state.taskData?.category,
                        onChanged: (value) {
                          taskBloc.add(ChangeTaskData(category: value));
                        },
                        title: "Category",
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskBloc, TaskState>(
                    buildWhen: (previous, current) => previous.taskData?.link != current.taskData?.link || previous.taskData?.category != current.taskData?.category || previous.uploadVideoFile != current.uploadVideoFile,
                    builder: (context, state) {
                      if(state.taskData == null || state.taskData!.category == 'youtube'){
                        return AppTextField(
                          title: "Link",
                          showTitle: false,
                          maxLines: 4,
                          initialValue: widget.taskModel != null ? widget.taskModel!.link : '',
                          onChanged: (value) {
                            taskBloc.add(ChangeTaskData(link: value));
                          },
                        );
                      }
                      return UploadImage(
                        key: ValueKey(state.uploadVideoFile.toString()),
                        imageFile: state.uploadVideoFile,
                        onTap: () async{
                          File? pickedVideo = await Utils.pickVideo();
                          taskBloc.add(ChangeTaskData(uploadVideoFile: pickedVideo));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<TaskBloc, TaskState>(
                    buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                    builder: (context, state) {
                      return AppButton(
                        title: widget.taskModel != null ? "Update" : "Add",
                        loading: state.actionApiStatus == ApiStatus.loading,
                        onTap: () {
                          taskBloc.add(UploadTask(taskId: widget.taskModel?.id));
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
