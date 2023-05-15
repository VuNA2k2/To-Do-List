part of 'project_detail_bloc.dart';

@immutable
abstract class ProjectDetailState {}

class ProjectDetailInitial extends ProjectDetailState {}

class ProjectDetailLoadingState extends ProjectDetailState {}

class ProjectDetailStableState extends ProjectDetailState {
  final ProjectViewModel projectViewModel;
  final List<TaskViewModel> taskViewModels;

  ProjectDetailStableState({
    required this.projectViewModel,
    required this.taskViewModels,
  });
}

class ProjectDetailLoadMoreState extends ProjectDetailStableState {
  ProjectDetailLoadMoreState({required super.projectViewModel, required super.taskViewModels});
}
