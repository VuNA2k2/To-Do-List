part of 'today_task_bloc.dart';

@immutable
abstract class TodayTaskState {}

class TodayTaskInitial extends TodayTaskState {}

class TodayTaskLoadingState extends TodayTaskState {}

class TodayTaskLoadMoreState extends TodayTaskStableState {
  TodayTaskLoadMoreState({required super.taskViewModels});
}

class TodayTaskStableState extends TodayTaskState {
  final List<TaskViewModel> taskViewModels;
  TodayTaskStableState({
    required this.taskViewModels,
  });
}
