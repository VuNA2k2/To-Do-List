part of 'create_task_bloc.dart';

@immutable
abstract class CreateTaskState {}

class CreateTaskInitial extends CreateTaskState {}

class CreateTaskLoading extends CreateTaskState {}

class CreateTaskStableState extends CreateTaskState {
  List<ProjectViewModel> listProject;
  ProjectViewModel? projectSelected;
  CreateTaskViewModel createTaskViewModel;

  CreateTaskStableState({
    required this.listProject,
    this.projectSelected,
    required this.createTaskViewModel,
  });
}
