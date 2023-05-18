part of 'do_task_bloc.dart';

@immutable
abstract class DoTaskEvent {}

class DoTaskInitialEvent extends DoTaskEvent {
  final int taskId;
  DoTaskInitialEvent({
    required this.taskId,
  });
}

class DoTaskStartEvent extends DoTaskEvent {
  final TaskDetailViewModel taskDetailViewModel;
  DoTaskStartEvent({
    required this.taskDetailViewModel,
  });
}


class DoTaskUpdateEvent extends DoTaskEvent {
  final TaskDetailViewModel taskDetailViewModel;
  DoTaskUpdateEvent({
    required this.taskDetailViewModel,
  });
}

class DoTaskUpdateViewEvent extends DoTaskEvent {}

class DoTaskPauseEvent extends DoTaskEvent {}

class DoTaskReplayEvent extends DoTaskEvent {}