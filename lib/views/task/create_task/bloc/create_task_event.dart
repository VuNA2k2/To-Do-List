part of 'create_task_bloc.dart';

@immutable
abstract class CreateTaskEvent {}

class CreateTaskInitialEvent extends CreateTaskEvent {}

class CreateTaskSaveEvent extends CreateTaskEvent {
}

class CreateTaskChangePriorityEvent extends CreateTaskEvent {
  final Priority priority;

  CreateTaskChangePriorityEvent(this.priority);
}

class CreateTaskChangeNumberOfPomodoroEvent extends CreateTaskEvent {
  final int numberOfPomodoro;

  CreateTaskChangeNumberOfPomodoroEvent(this.numberOfPomodoro);
}

class CreateTaskChangeProjectEvent extends CreateTaskEvent {
  final ProjectViewModel projectViewModel;

  CreateTaskChangeProjectEvent(this.projectViewModel);
}

class CreateTaskChangeDeadlineEvent extends CreateTaskEvent {
  final DateTime? dateTime;

  CreateTaskChangeDeadlineEvent(this.dateTime);
}



