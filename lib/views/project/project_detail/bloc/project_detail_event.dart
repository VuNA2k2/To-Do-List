part of 'project_detail_bloc.dart';

@immutable
abstract class ProjectDetailEvent {}

class ProjectDetailInitialEvent extends ProjectDetailEvent {
  final ProjectViewModel projectViewModel;
  ProjectDetailInitialEvent(this.projectViewModel);
}

class ProjectDetailLoadMoreEvent extends ProjectDetailEvent {}

class ProjectDetailDeleteProjectEvent extends ProjectDetailEvent {
  final ProjectViewModel projectViewModel;
  ProjectDetailDeleteProjectEvent({required this.projectViewModel});
}
