import 'package:data/src/remote/dto/enum/priority.dart';
import 'package:data/src/remote/dto/project/project_mapper.dart';
import 'package:data/src/remote/dto/task/do_task_input_dto.dart';
import 'package:data/src/remote/dto/task/task_detail_output_dto.dart';
import 'package:data/src/remote/dto/task/task_input_dto.dart';
import 'package:data/src/remote/dto/task/task_output_dto.dart';
import 'package:domain/domain.dart' as domain;

class TaskMapper {
  static domain.TaskEntity getTaskEntityFromTaskOutputDto(
      TaskOutputDto taskOutputDto) {
    return domain.TaskEntity(
      id: taskOutputDto.id,
      projectId: taskOutputDto.projectId,
      title: taskOutputDto.title,
      subtitle: taskOutputDto.subtitle,
      numberOfPomodoro: taskOutputDto.numberOfPomodoro,
      progress: taskOutputDto.progress,
      status: domain.Status.values.firstWhere(
        (element) => element.name == taskOutputDto.status.name,
        orElse: () => domain.Status.values.first,
      ),
      deadline: taskOutputDto.deadline,
    );
  }

  static TaskInputDto getTaskInputDtoFromTaskEntity(
      domain.TaskEntity taskEntity) {
    return TaskInputDto(
      title: taskEntity.title,
      subtitle: taskEntity.subtitle,
      description: taskEntity.description,
      numberOfPomodoro: taskEntity.numberOfPomodoro,
      currentDoingTime: taskEntity.currentDoingTime,
      deadline: taskEntity.deadline,
      projectId: taskEntity.projectId,
      priority: Priority.values.firstWhere(
        (element) => element.name == taskEntity.priority?.name,
        orElse: () => Priority.values.first,
      ),
    );
  }

  static domain.TaskEntity getTaskEntityFromTaskDetailOutputDto(
      TaskDetailOutputDto taskDetailOutputDto) {
    return domain.TaskEntity(
        id: taskDetailOutputDto.id,
        projectId: taskDetailOutputDto.project.id,
        title: taskDetailOutputDto.title,
        priority: domain.Priority.values.firstWhere(
            (element) => element.name == taskDetailOutputDto.priority.name,
            orElse: () => domain.Priority.values.first),
        numberOfPomodoro: taskDetailOutputDto.numberOfPomodoro,
        deadline: taskDetailOutputDto.deadline,
        progress: taskDetailOutputDto.progress,
        status: domain.Status.values.firstWhere(
            (element) => element.name == taskDetailOutputDto.status.name,
            orElse: () => domain.Status.values.first),
        currentDoingTime: taskDetailOutputDto.currentDoingTime,
        description: taskDetailOutputDto.description,
        project: ProjectMapper.getProjectEntityFromProjectOutputDto(
            taskDetailOutputDto.project),
        reminder: taskDetailOutputDto.reminder,
        subtitle: taskDetailOutputDto.subtitle);
  }

  static DoTaskInputDto getDoTaskInputDtoFromTaskEntity(domain.TaskEntity taskEntity) {
    return DoTaskInputDto(duration: taskEntity.currentDoingTime ?? const Duration(seconds: 0));
  }
}