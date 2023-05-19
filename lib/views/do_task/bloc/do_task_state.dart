part of 'do_task_bloc.dart';

@immutable
abstract class DoTaskState {}

class DoTaskInitial extends DoTaskState {}

class DoTaskLoading extends DoTaskState {}

class DoTaskStableState extends DoTaskState {
  int session;
  int timeOfSession;
  final TaskDetailViewModel taskDetailViewModel;

  DoTaskStableState({required this.taskDetailViewModel, this.session = 0, this.timeOfSession = 0});
}

class DoTaskPauseState extends DoTaskStableState {
  DoTaskPauseState({required super.taskDetailViewModel, required super.session, required super.timeOfSession});
}

class DoTaskPlayingState extends DoTaskStableState {
  DoTaskPlayingState({required super.taskDetailViewModel, required super.session, required super.timeOfSession});
}

class DoTaskErrorState extends DoTaskState {
  final String message;

  DoTaskErrorState(
    this.message,
  );
}