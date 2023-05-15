import 'package:domain/domain.dart';
import 'package:domain/src/entities/priority.dart';
import 'package:domain/src/entities/status.dart';
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  int? id;
  int projectId;
  ProjectEntity? project;
  String title;
  String? subtitle;
  String? description;
  int numberOfPomodoro;
  Duration? currentDoingTime;
  DateTime deadline;
  Status status;
  bool? reminder;
  double? progress;
  Priority? priority;

  TaskEntity({
    this.id,
    required this.projectId,
    this.project,
    required this.title,
    this.subtitle,
    this.description,
    required this.numberOfPomodoro,
    this.currentDoingTime,
    required this.deadline,
    required this.status,
    this.reminder,
    this.progress = 0.0,
    this.priority,
  });

  @override
  List<Object?> get props => [id];
}