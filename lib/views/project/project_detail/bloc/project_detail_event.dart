part of 'project_detail_bloc.dart';

@immutable
abstract class ProjectDetailEvent {}

class ProjectDetailInitialEvent extends ProjectDetailEvent {
  final ProjectViewModel projectViewModel;
  ProjectDetailInitialEvent(this.projectViewModel);
}
