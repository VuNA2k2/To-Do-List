part of 'all_project_bloc.dart';

@immutable
abstract class AllProjectState {}

class AllProjectInitial extends AllProjectState {}

class AllProjectLoadingState extends AllProjectState {}

class AllProjectStableState extends AllProjectState {
  final List<ProjectViewModel> projectViewModels;

  AllProjectStableState({
    required this.projectViewModels,
  });
}

class AllProjectLoadMoreState extends AllProjectStableState {
  AllProjectLoadMoreState({
    required super.projectViewModels,
  });
}

class AllProjectErrorState extends AllProjectState {
  final String message;

  AllProjectErrorState({
    required this.message,
  });
}
