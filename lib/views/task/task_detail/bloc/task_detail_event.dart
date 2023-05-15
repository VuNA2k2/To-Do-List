part of 'task_detail_bloc.dart';

@immutable
abstract class TaskDetailEvent {}

class TaskDetailInitialEvent extends TaskDetailEvent {
  TaskDetailInitialEvent({required this.taskViewModel});

  final TaskViewModel taskViewModel;
}
