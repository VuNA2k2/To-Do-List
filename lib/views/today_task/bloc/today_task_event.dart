part of 'today_task_bloc.dart';

@immutable
abstract class TodayTaskEvent {}

class TodayTaskInitialEvent extends TodayTaskEvent {}

class TodayTaskLoadMoreEvent extends TodayTaskEvent {}