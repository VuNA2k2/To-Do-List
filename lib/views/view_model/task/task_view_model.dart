import 'package:equatable/equatable.dart';

class TaskViewModel extends Equatable {
  int? id;
  String? title;
  String? subtitle;
  double? progress;
  int? numberOfPomodoro;
  TaskViewModel({
    this.id,
    this.title = '',
    this.subtitle = '',
    this.progress = 0,
    this.numberOfPomodoro = 0,
  });

  @override
  List<Object?> get props => [id];
}