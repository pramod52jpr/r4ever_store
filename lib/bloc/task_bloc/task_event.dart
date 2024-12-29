part of 'task_bloc.dart';

class TaskEvent extends Equatable{
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class FetchAllTaskData extends TaskEvent{
  final String? category;
  const FetchAllTaskData({this.category});

  @override
  List<Object?> get props => [category];
}

class ChangeTaskData extends TaskEvent{
  final String? link;
  final String? category;
  final dynamic uploadVideoFile;

  const ChangeTaskData({this.link, this.category, this.uploadVideoFile});

  @override
  List<Object?> get props => [
    link,
    category,
    uploadVideoFile,
  ];
}

class UploadTask extends TaskEvent{
  final String? taskId;
  const UploadTask({this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class DeleteTask extends TaskEvent{
  final String taskId;
  const DeleteTask({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class AddTaskWork extends TaskEvent{
  final String taskId;
  const AddTaskWork({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}

class EmptyTaskData extends TaskEvent{}

class FetchMyTask extends TaskEvent{}

class ChangeTaskImage extends TaskEvent{
  final dynamic taskImage;
  const ChangeTaskImage({this.taskImage});

  @override
  List<Object?> get props => [taskImage];
}

class ChangeSubscribedStatus extends TaskEvent{
  final bool subscribed;
  const ChangeSubscribedStatus({required this.subscribed});

  @override
  List<Object?> get props => [subscribed];
}

class UpdateTaskWork extends TaskEvent{
  final String taskWorkId;
  final bool nonYoutubeTask;
  const UpdateTaskWork({required this.taskWorkId, this.nonYoutubeTask = false});

  @override
  List<Object?> get props => [taskWorkId, nonYoutubeTask];
}

class BackToInitial extends TaskEvent{}