import 'package:data/src/remote/dto/enum/priority.dart';
import 'package:data/src/remote/dto/enum/status.dart';

class TaskInputDto {
  String title;
  String? subtitle;
  String? description;
  Priority? priority = Priority.LOW;
  int numberOfPomodoro;
  Duration? currentDoingTime;
  DateTime deadline;
  Status? status;
  int projectId;
  TaskInputDto({
    required this.title,
    this.subtitle,
    this.description,
    this.priority,
    required this.numberOfPomodoro,
    this.currentDoingTime,
    required this.deadline,
    this.status,
    required this.projectId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'priority': priority?.name ?? Priority.LOW.name,
      'numberOfPomodoro': numberOfPomodoro,
      'currentDoingTime': currentDoingTime != null ? "${currentDoingTime?.inHours}:${currentDoingTime?.inMinutes.remainder(60)}:${currentDoingTime?.inSeconds.remainder(60)}" : null,
      'deadline': DateTime.utc(deadline.year, deadline.month, deadline.day, deadline.hour, deadline.minute, deadline.second, deadline.millisecond, deadline.microsecond).toIso8601String(),
      'status': status?.name ?? Status.TODO.name,
      'projectId': projectId,
    };
  }
}