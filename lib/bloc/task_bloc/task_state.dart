part of 'task_bloc.dart';

class TaskState extends Equatable{
  final List<TaskModel> allTask;
  final TaskModel? taskData;
  final List<TaskWork> myTaskWork;
  final dynamic uploadVideoFile;

  final dynamic taskImage;
  final bool subscribed;

  final ApiStatus fetchDataApiStatus;
  final ApiStatus actionApiStatus;
  final ApiStatus deleteApiStatus;
  final String successMsg;
  final String error;

  const TaskState({
    this.allTask = const [],
    this.taskData,
    this.myTaskWork = const [],
    this.uploadVideoFile,

    this.taskImage,
    this.subscribed = false,

    this.fetchDataApiStatus = ApiStatus.initial,
    this.actionApiStatus = ApiStatus.initial,
    this.deleteApiStatus = ApiStatus.initial,
    this.successMsg = '',
    this.error = '',
  });

  TaskState backToInitial(){
    return const TaskState(
      allTask: [],
      taskData: null,
      myTaskWork: [],
      uploadVideoFile: null,
      taskImage: null,
      subscribed: false,

      fetchDataApiStatus: ApiStatus.initial,
      actionApiStatus: ApiStatus.initial,
      deleteApiStatus: ApiStatus.initial,
      successMsg: '',
      error: '',
    );
  }

  TaskState emptyAdminAddTaskData({
    TaskModel? taskData,
    dynamic uploadVideoFile,
  }){
    return TaskState(
      allTask: allTask,
      taskData: taskData,
      myTaskWork: myTaskWork,
      uploadVideoFile: uploadVideoFile,

      taskImage: taskImage,
      subscribed: subscribed,

      fetchDataApiStatus: fetchDataApiStatus,
      actionApiStatus: actionApiStatus,
      deleteApiStatus: deleteApiStatus,
      successMsg: successMsg,
      error: error,
    );
  }

  TaskState copyWith({
    List<TaskModel>? allTask,
    TaskModel? taskData,
    List<TaskWork>? myTaskWork,
    dynamic uploadVideoFile,

    dynamic taskImage,
    bool? subscribed,

    ApiStatus? fetchDataApiStatus,
    ApiStatus? actionApiStatus,
    ApiStatus? deleteApiStatus,
    String? successMsg,
    String? error,
  }){
    return TaskState(
      allTask: allTask ?? this.allTask,
      taskData: taskData ?? this.taskData,
      myTaskWork: myTaskWork ?? this.myTaskWork,
      uploadVideoFile: uploadVideoFile ?? this.uploadVideoFile,

      taskImage: taskImage ?? this.taskImage,
      subscribed: subscribed ?? this.subscribed,

      fetchDataApiStatus: fetchDataApiStatus ?? this.fetchDataApiStatus,
      actionApiStatus: actionApiStatus ?? this.actionApiStatus,
      deleteApiStatus: deleteApiStatus ?? this.deleteApiStatus,
      successMsg: successMsg ?? this.successMsg,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    allTask,
    taskData,
    myTaskWork,
    uploadVideoFile,

    taskImage,
    subscribed,

    fetchDataApiStatus,
    actionApiStatus,
    deleteApiStatus,
    successMsg,
    error,
  ];
}