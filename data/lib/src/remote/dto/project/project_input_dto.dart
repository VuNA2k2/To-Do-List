import 'package:data/src/remote/dto/enum/priority.dart';
import 'package:data/src/remote/dto/enum/status.dart';

class ProjectInputDto {
  String name;
  String? description;
  Priority priority;
  DateTime deadline;
  Status status;
  ProjectInputDto({
    required this.name,
    this.description,
    required this.priority,
    required this.deadline,
    required this.status,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "priority": priority.name,
      "deadline": DateTime.utc(deadline.year, deadline.month, deadline.day, deadline.hour, deadline.minute, deadline.second).toIso8601String(),
      "status": status.name,
    };
  }
}