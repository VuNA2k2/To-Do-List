import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class ProjectViewModel extends Equatable {
  int id;
  String name;
  String? description;
  Priority priority;
  DateTime deadline;
  int? countAllTask;
  int? countDoneTask;
  double progress;
  ProjectViewModel({
    required this.id,
    required this.name,
    this.description = '',
    required this.priority,
    required this.deadline,
    this.countAllTask = 0,
    this.countDoneTask = 0,
    required this.progress,
  });

  @override
  List<Object?> get props => [id];
}