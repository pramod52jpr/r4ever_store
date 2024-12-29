import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/model/all_task_model/all_task_model.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class TaskOnCategory extends StatefulWidget {
  final String category;
  const TaskOnCategory({super.key, required this.category});

  @override
  State<TaskOnCategory> createState() => _TaskOnCategoryState();
}

class _TaskOnCategoryState extends State<TaskOnCategory> {
  late TaskBloc taskBloc;
  int currentLoading = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBloc = context.read<TaskBloc>();
    taskBloc.add(FetchAllTaskData(category: widget.category));
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
      appBar: AppBar(
        title: const Text("Tasks", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: BlocListener<TaskBloc, TaskState>(
                listenWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                listener: (context, state) {
                  if(state.actionApiStatus == ApiStatus.error){
                    Utils.showFlushBar(state.error, FlushBarType.error, context);
                  }
                  if(state.actionApiStatus == ApiStatus.success){
                    taskBloc.add(FetchAllTaskData(category: widget.category));
                    Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
                  }
                },
                child: BlocBuilder<TaskBloc, TaskState>(
                  buildWhen: (previous, current) => previous.fetchDataApiStatus != current.fetchDataApiStatus,
                  builder: (context, state) {
                    if(state.fetchDataApiStatus == ApiStatus.loading || state.fetchDataApiStatus == ApiStatus.initial){
                      return const LoadingWidget();
                    }
                    if(state.fetchDataApiStatus == ApiStatus.error){
                      return CustomErrorWidget(message: state.error);
                    }
                    List<TaskModel> data = state.allTask.where((element) => element.category == widget.category).toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        TaskModel task = data[index];
                        return Container(
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
                                    Text("Link : ${task.link}", style: const TextStyle(fontSize: 15),),
                                    Text("Category : ${task.category == 'localBusiness' ? "Local Business" : task.category == 'business' ? "Business" : "Youtube"}")
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Row(
                                children: [
                                  BlocBuilder<TaskBloc, TaskState>(
                                    buildWhen: (previous, current) => previous.actionApiStatus != current.actionApiStatus,
                                    builder: (context, state) {
                                      return GestureDetector(
                                        onTap: () {
                                          if(!task.assigned){
                                            currentLoading = index;
                                            taskBloc.add(AddTaskWork(taskId: task.id));
                                          }
                                        },
                                        child: state.actionApiStatus == ApiStatus.loading && currentLoading == index
                                          ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        )
                                        : task.assigned ?
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                          ),
                                          child: const Icon(Icons.check_circle, color: Colors.green, size: 25),
                                        )
                                            : Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue,
                                          ),
                                          child: const Icon(Icons.add, color: Colors.white, size: 18),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
