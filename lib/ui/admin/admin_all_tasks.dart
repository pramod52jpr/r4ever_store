import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r4everstore/bloc/task_bloc/task_bloc.dart';
import 'package:r4everstore/data/model/all_task_model/all_task_model.dart';
import 'package:r4everstore/data/routes/routes_name.dart';
import 'package:r4everstore/ui/admin/add_task_screen.dart';
import 'package:r4everstore/utils/enum.dart';
import 'package:r4everstore/utils/utils.dart';
import 'package:r4everstore/widgets/custom_error_widget.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class AdminAllTasks extends StatefulWidget {
  const AdminAllTasks({super.key});

  @override
  State<AdminAllTasks> createState() => _AdminAllTasksState();
}

class _AdminAllTasksState extends State<AdminAllTasks> {
  late TaskBloc taskBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBloc = context.read<TaskBloc>();
    taskBloc.add(const FetchAllTaskData());
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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.addTaskScreen);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: BlocListener<TaskBloc, TaskState>(
        listenWhen: (previous, current) => previous.deleteApiStatus != current.deleteApiStatus,
        listener: (context, state) {
          if(state.deleteApiStatus == ApiStatus.error){
            Utils.showFlushBar(state.error, FlushBarType.error, context);
          }
          if(state.deleteApiStatus == ApiStatus.success){
            Utils.showFlushBar(state.successMsg, FlushBarType.success, context);
            taskBloc.add(const FetchAllTaskData());
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
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: state.allTask.length,
              itemBuilder: (context, index) {
                TaskModel task = state.allTask[index];
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
                            Text("Category : ${task.category}")
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen(taskModel: task)));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: const Icon(Icons.edit, color: Colors.white, size: 18),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Utils.showActionDialog(
                                title: "Delete",
                                content: "Are you sure want to delete?",
                                context: context,
                                onTap: () {
                                  taskBloc.add(DeleteTask(taskId: task.id));
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: const Icon(Icons.delete, color: Colors.white, size: 18),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
