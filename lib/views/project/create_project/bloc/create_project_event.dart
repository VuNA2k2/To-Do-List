part of 'create_project_bloc.dart';

@immutable
abstract class CreateProjectEvent {}

class CreateProjectInitialEvent extends CreateProjectEvent {}

class CreateProjectPriorityChangedEvent extends CreateProjectEvent {
  final Priority priority;

  CreateProjectPriorityChangedEvent({required this.priority});
}

class CreateProjectDeadlineChangedEvent extends CreateProjectEvent {
  final DateTime deadline;

  CreateProjectDeadlineChangedEvent({required this.deadline});
}

class CreateProjectSaveEvent extends CreateProjectEvent {}
