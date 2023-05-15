import 'package:domain/domain.dart';

class CreateTaskViewModel {
  String title;
  int projectId;
  String? subtitle;
  String? description;
  Priority priority;
  int numberOfPomodoro;
  DateTime deadline;
  Status status;
  CreateTaskViewModel({
    required this.title,
    required this.projectId,
    this.subtitle,
    this.description,
    required this.priority,
    required this.numberOfPomodoro,
    required this.deadline,
    required this.status,
  });
}