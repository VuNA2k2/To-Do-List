import 'package:domain/domain.dart';
import 'package:todo_list/views/dashboard/view_model/task/task_view_model.dart';

class TaskMapper {
  static TaskViewModel getTaskViewModelFromTaskEntity(TaskEntity taskEntity) {
    return TaskViewModel(
      id: taskEntity.id,
      title: taskEntity.title,
      subtitle: taskEntity.subtitle,
      progress: taskEntity.progress,
      numberOfPomodoro: taskEntity.numberOfPomodoro,
    );
  }
}