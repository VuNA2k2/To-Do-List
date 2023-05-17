import 'package:domain/domain.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';

class CreateProjectViewModel {
  String title;
  String? description;
  Priority priority;
  DateTime deadline;
  CreateProjectViewModel({
    required this.title,
    this.description,
    required this.priority,
    required this.deadline,
  });

  factory CreateProjectViewModel.fromProjectViewModel(ProjectViewModel projectViewModel) {
    return CreateProjectViewModel(title: projectViewModel.name, priority: projectViewModel.priority, deadline: projectViewModel.deadline, description: projectViewModel.description);
  }
}