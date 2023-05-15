import 'package:data/src/remote/dto/project/project_mapper.dart';
import 'package:data/src/remote/dto/task/task_detail_output_dto.dart';
import 'package:data/src/remote/dto/task/task_output_dto.dart';
import 'package:domain/domain.dart';

class TaskMapper {
  static TaskEntity getTaskEntityFromTaskOutputDto(TaskOutputDto taskOutputDto) {
    return TaskEntity(
      id: taskOutputDto.id,
      projectId: taskOutputDto.projectId,
      title: taskOutputDto.title,
      subtitle: taskOutputDto.subtitle,
      numberOfPomodoro: taskOutputDto.numberOfPomodoro,
      progress: taskOutputDto.progress,
      status: Status.values.firstWhere(
        (element) => element.name == taskOutputDto.status.name,
        orElse: () => Status.values.first,
      ),
      deadline: taskOutputDto.deadline,
    );
  }

  static TaskEntity getTaskEntityFromTaskDetailOutputDto(TaskDetailOutputDto taskDetailOutputDto) {
    return TaskEntity(id: taskDetailOutputDto.id, projectId: taskDetailOutputDto.project.id, title: taskDetailOutputDto.title, numberOfPomodoro: taskDetailOutputDto.numberOfPomodoro, deadline: taskDetailOutputDto.deadline, status: Status.values.firstWhere((element) => element.name == taskDetailOutputDto.status.name, orElse: () => Status.values.first), currentDoingTime: taskDetailOutputDto.currentDoingTime, description: taskDetailOutputDto.description, project: ProjectMapper.getProjectEntityFromProjectOutputDto(taskDetailOutputDto.project), reminder: taskDetailOutputDto.reminder, subtitle: taskDetailOutputDto.subtitle);
  }
}