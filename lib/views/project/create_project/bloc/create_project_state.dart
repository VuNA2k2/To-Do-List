part of 'create_project_bloc.dart';

@immutable
abstract class CreateProjectState {}

class CreateProjectInitial extends CreateProjectState {}

class CreateProjectStableState extends CreateProjectState {
  CreateProjectViewModel createProjectViewModel;
  CreateProjectStableState({required this.createProjectViewModel});
}

class CreateProjectLoadingState extends CreateProjectState {}

class CreateProjectErrorState extends CreateProjectState {
  final String message;

  CreateProjectErrorState(
    this.message,
  );
}


