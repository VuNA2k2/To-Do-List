import 'package:domain/src/entities/status.dart';
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  int id;
  int projectId;
  String title;
  String? subtitle;
  String? description;
  int numberOfPomodoro;
  DateTime? currentDoingTime;
  DateTime deadline;
  Status status;
  bool? reminder;
  double? progress;

  TaskEntity({
    required this.id,
    required this.projectId,
    required this.title,
    this.subtitle,
    this.description,
    required this.numberOfPomodoro,
    this.currentDoingTime,
    required this.deadline,
    required this.status,
    this.reminder,
    this.progress = 0.0,
  });

  @override
  List<Object?> get props => [id];
}