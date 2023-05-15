import 'package:data/src/remote/dto/enum/status.dart';
import 'package:data/src/remote/dto/project/project_output_dto.dart';
import 'package:equatable/equatable.dart';

class TaskDetailOutputDto extends Equatable {
  final int id;
  final ProjectOutputDto project;
  final String title;
  final String subtitle;
  final String description;
  final int numberOfPomodoro;
  final DateTime deadline;
  final Duration currentDoingTime;
  final Status status;
  final bool reminder;

  TaskDetailOutputDto({
    required this.id,
    required this.project,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.numberOfPomodoro,
    required this.deadline,
    required this.currentDoingTime,
    required this.status,
    required this.reminder,
  });

  factory TaskDetailOutputDto.fromJson(Map<String, dynamic> json) {
    return TaskDetailOutputDto(
      id: json['id'],
      project: ProjectOutputDto.fromJson(json['project']),
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      numberOfPomodoro: json['numberOfPomodoro'],
      deadline: DateTime.parse(json['deadline']),
      currentDoingTime: _parseDuration(json['currentDoingTime'] ?? '00:00:00'),
      status: Status.values.firstWhere((element) => element.name == json['status'], orElse: () => Status.values.first),
      reminder: json['reminder'],
    );
  }

  static Duration _parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  @override
  List<Object?> get props => [id];

}