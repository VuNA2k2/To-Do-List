part of 'task_detail_bloc.dart';

@immutable
abstract class TaskDetailEvent {}

class TaskDetailInitialEvent extends TaskDetailEvent {
  TaskDetailInitialEvent({required this.taskViewModel});

  final TaskViewModel taskViewModel;
}

class TaskDetailDeleteEvent extends TaskDetailEvent {
  TaskDetailDeleteEvent({required this.taskDetailViewModel});

  final TaskDetailViewModel taskDetailViewModel;
}
