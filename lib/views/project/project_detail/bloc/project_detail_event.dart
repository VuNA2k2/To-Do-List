part of 'project_detail_bloc.dart';

@immutable
abstract class ProjectDetailEvent {}

class ProjectDetailInitialEvent extends ProjectDetailEvent {
  final ProjectViewModel projectViewModel;
  String keyword = '';
  ProjectDetailInitialEvent(this.projectViewModel, {this.keyword = ''});
}

class ProjectDetailLoadMoreEvent extends ProjectDetailEvent {}

class ProjectDetailDeleteProjectEvent extends ProjectDetailEvent {
  final ProjectViewModel projectViewModel;
  ProjectDetailDeleteProjectEvent({required this.projectViewModel});
}

class ProjectDetailUpdateProjectEvent extends ProjectDetailEvent {
  final ProjectViewModel projectViewModel;
  ProjectDetailUpdateProjectEvent({required this.projectViewModel});
}
