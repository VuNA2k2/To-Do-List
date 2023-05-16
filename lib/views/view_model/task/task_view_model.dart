import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class TaskViewModel extends Equatable {
  int? id;
  int? projectId;
  String? title;
  String? subtitle;
  double? progress;
  int? numberOfPomodoro;
  DateTime? deadline;
  Status? status;
  TaskViewModel({
    this.id,
    this.title = '',
    this.subtitle = '',
    this.progress = 0,
    this.numberOfPomodoro = 0,
    this.projectId,
    this.status = Status.TODO,
    this.deadline,
  });

  @override
  List<Object?> get props => [id];
}