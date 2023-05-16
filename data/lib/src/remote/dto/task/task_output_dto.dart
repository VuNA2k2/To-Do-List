import 'package:data/src/remote/dto/enum/status.dart';
import 'package:equatable/equatable.dart';

class TaskOutputDto extends Equatable {
  int id;
  int projectId;
  String title;
  String subtitle;
  int numberOfPomodoro;
  DateTime deadline;
  double progress;
  Status status;
  TaskOutputDto({
    required this.id,
    required this.projectId,
    required this.title,
    required this.subtitle,
    required this.numberOfPomodoro,
    required this.deadline,
    required this.progress,
    required this.status,
  });
  factory TaskOutputDto.fromJson(Map<String, dynamic> json) {
    return TaskOutputDto(
      id: json['id'],
      projectId: json['projectId'],
      title: json['title'],
      subtitle: json['subtitle'],
      numberOfPomodoro: json['numberOfPomodoro'],
      deadline: DateTime.parse(json['deadline']),
      progress: json['progress'] ?? 0.0,
      status: Status.values.firstWhere((element) => element.name == json['status'], orElse: () => Status.values.first),
    );
  }

  @override
  List<Object?> get props => [id];
}