import 'package:domain/domain.dart';
import 'package:todo_list/views/all_project/view_model/project_mapper.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_view_model.dart';

class TaskDetailMapper {
  static TaskDetailViewModel getTaskDetailViewModelFromTaskEntity(
      TaskEntity taskEntity) {
    return TaskDetailViewModel(
      id: taskEntity.id!,
      title: taskEntity.title,
      subtitle: taskEntity.subtitle,
      description: taskEntity.description,
      project: ProjectMapper.getProjectViewModelFromProjectEntity(taskEntity.project!),
      numberOfPomodoro: taskEntity.numberOfPomodoro,
      progress: taskEntity.progress ?? 0.0,
      deadline: taskEntity.deadline,
      priority: taskEntity.priority ?? Priority.LOW,
      status: taskEntity.status,
      currentDoingTime: taskEntity.currentDoingTime,
    );
  }

  static TaskEntity getTaskEntityFromTaskDetailMapper(TaskDetailViewModel taskDetailViewModel) {
    return TaskEntity(projectId: taskDetailViewModel.project.id, title: taskDetailViewModel.title, numberOfPomodoro: taskDetailViewModel.numberOfPomodoro, deadline: taskDetailViewModel.deadline, status: taskDetailViewModel.status, currentDoingTime: taskDetailViewModel.currentDoingTime);
  }
}
