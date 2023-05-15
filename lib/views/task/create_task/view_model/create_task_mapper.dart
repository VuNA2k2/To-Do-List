import 'package:domain/domain.dart';
import 'package:todo_list/views/task/create_task/view_model/create_task_view_model.dart';

class CreateTaskMapper {
  static TaskEntity getTaskEntityFromCreateTaskViewModel(CreateTaskViewModel createTaskViewModel) {
    return TaskEntity(
      title: createTaskViewModel.title,
      projectId: createTaskViewModel.projectId,
      subtitle: createTaskViewModel.subtitle,
      description: createTaskViewModel.description,
      priority: createTaskViewModel.priority,
      numberOfPomodoro: createTaskViewModel.numberOfPomodoro,
      deadline: createTaskViewModel.deadline,
      status: createTaskViewModel.status,
    );
  }
}