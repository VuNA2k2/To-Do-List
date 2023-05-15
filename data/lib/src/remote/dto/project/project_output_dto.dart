import 'package:data/src/remote/dto/enum/priority.dart';
import 'package:data/src/remote/dto/enum/status.dart';

class ProjectOutputDto {
  int id;
  String name;
  String? description;
  DateTime deadline;
  Priority priority;
  Status status;
  double? progress;
  int? countAllTask;
  int? countDoneTask;

  ProjectOutputDto({
    required this.id,
    required this.name,
    this.description,
    required this.deadline,
    required this.priority,
    required this.status,
    this.progress,
    this.countAllTask,
    this.countDoneTask,
  });

  factory ProjectOutputDto.fromJson(Map<String, dynamic> json) {
    return ProjectOutputDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      deadline: DateTime.parse(json['deadline']),
      priority: Priority.values.firstWhere((e) => e.name == json['priority'], orElse: () => Priority.values.first),
      status: Status.values.firstWhere((e) => e.name == json['status'], orElse: () => Status.values.first),
      progress: json['progress'],
      countAllTask: json['countAllTask'],
      countDoneTask: json['countDoneTask'],
    );
  }
}