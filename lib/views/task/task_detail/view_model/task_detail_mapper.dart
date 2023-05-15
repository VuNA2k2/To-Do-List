import 'package:domain/domain.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_view_model.dart';

class TaskDetailMapper {
  static TaskDetailViewModel getTaskDetailViewModelFromTaskEntity(
      TaskEntity taskEntity) {
    return TaskDetailViewModel(
      id: taskEntity.id!,
      title: taskEntity.title,
      projectName: taskEntity.project?.name ?? '',
      numberOfPomodoro: taskEntity.numberOfPomodoro,
      progress: taskEntity.progress ?? 0.0,
      deadline: taskEntity.deadline,
      priority: taskEntity.priority ?? Priority.LOW,
    );
  }
}
