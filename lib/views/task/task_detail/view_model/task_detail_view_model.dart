import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class TaskDetailViewModel extends Equatable {
  int id;
  String title;
  String? subtitle;
  String? description;
  String projectName;
  int numberOfPomodoro;
  double progress;
  DateTime deadline;
  Priority priority;
  TaskDetailViewModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.description,
    required this.projectName,
    required this.numberOfPomodoro,
    required this.progress,
    required this.deadline,
    required this.priority,
  });
  @override
  List<Object?> get props => [
        id,
      ];

}