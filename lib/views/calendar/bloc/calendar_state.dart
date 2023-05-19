part of 'calendar_bloc.dart';

@immutable
abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarLoadingState extends CalendarState {}

class CalendarLoadMoreState extends CalendarStableState {
  CalendarLoadMoreState({required super.focusDay, required super.taskViewModels});
}

class CalendarStableState extends CalendarState {
  DateTime focusDay;
  List<TaskViewModel> taskViewModels;
  CalendarStableState({
    required this.focusDay,
    required this.taskViewModels,
  });
}

class CalendarErrorState extends CalendarState {
  final String message;

  CalendarErrorState({
    required this.message,
  });
}


