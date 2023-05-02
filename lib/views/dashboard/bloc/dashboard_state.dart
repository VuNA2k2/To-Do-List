part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardStableState extends DashboardState {
  List<TaskViewModel> taskViewModels;
  List<NoteViewModel> noteViewModels;
  int countTask;
  int countNote;
  DashboardStableState({
    required this.taskViewModels,
    required this.countTask,
    required this.noteViewModels,
    required this.countNote,
  });
}