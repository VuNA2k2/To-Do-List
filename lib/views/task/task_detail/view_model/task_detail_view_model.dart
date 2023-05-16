import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';

class TaskDetailViewModel extends Equatable {
  int id;
  String title;
  String? subtitle;
  String? description;
  ProjectViewModel project;
  int numberOfPomodoro;
  double progress;
  DateTime deadline;
  Priority priority;
  Status status;
  TaskDetailViewModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.description,
    required this.project,
    required this.numberOfPomodoro,
    required this.progress,
    required this.deadline,
    required this.priority,
    required this.status,
  });
  @override
  List<Object?> get props => [
        id,
      ];

}