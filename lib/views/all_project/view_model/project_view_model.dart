import 'package:equatable/equatable.dart';

class ProjectViewModel extends Equatable {
  int id;
  String name;
  String? description;
  int? countAllTask;
  int? countDoneTask;
  double progress;
  ProjectViewModel({
    required this.id,
    required this.name,
    this.description = '',
    this.countAllTask = 0,
    this.countDoneTask = 0,
    required this.progress,
  });

  @override
  List<Object?> get props => [id];
}