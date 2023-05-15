part of 'task_detail_bloc.dart';

@immutable
abstract class TaskDetailState {}

class TaskDetailInitial extends TaskDetailState {}

class TaskDetailLoadingState extends TaskDetailState {}

class TaskDetailStableState extends TaskDetailState {
  TaskDetailStableState({required this.taskDetailViewModel});

  final TaskDetailViewModel taskDetailViewModel;
}


