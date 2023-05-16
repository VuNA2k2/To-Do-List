import 'package:domain/domain.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_view_model.dart';

class CreateTaskViewModel {
  String title;
  int projectId;
  String? subtitle;
  String? description;
  Priority priority;
  int numberOfPomodoro;
  DateTime deadline;
  Status status;

  CreateTaskViewModel({
    required this.title,
    required this.projectId,
    this.subtitle,
    this.description,
    required this.priority,
    required this.numberOfPomodoro,
    required this.deadline,
    required this.status,
  });

  factory CreateTaskViewModel.fromTaskViewModel(
      TaskDetailViewModel taskDetailViewModel) {
    return CreateTaskViewModel(
      title: taskDetailViewModel.title,
      projectId: taskDetailViewModel.project.id,
      priority: taskDetailViewModel.priority,
      numberOfPomodoro: taskDetailViewModel.numberOfPomodoro,
      deadline: taskDetailViewModel.deadline,
      status: taskDetailViewModel.status,
    );
  }
}