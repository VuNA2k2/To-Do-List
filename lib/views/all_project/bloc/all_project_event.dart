part of 'all_project_bloc.dart';

@immutable
abstract class AllProjectEvent {}

class AllProjectInitialEvent extends AllProjectEvent {
  String keyword = "";
  AllProjectInitialEvent({this.keyword = ""});
}

class AllProjectLoadMoreEvent extends AllProjectEvent {}

class AllProjectDeleteProjectEvent extends AllProjectEvent {
  final int projectId;

  AllProjectDeleteProjectEvent({required this.projectId});
}