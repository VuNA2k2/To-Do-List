import 'package:domain/src/entities/status.dart';
import 'package:equatable/equatable.dart';
import 'package:domain/src/entities/priority.dart';

class ProjectEntity extends Equatable {
  int id;
  String name;
  String? description;
  DateTime deadline;
  Priority priority;
  Status status;
  double? progress;
  ProjectEntity({
    required this.id,
    required this.name,
    this.description,
    required this.deadline,
    required this.priority,
    required this.status,
    this.progress = 0.0,
  });

  @override
  List<Object?> get props => [id];
}