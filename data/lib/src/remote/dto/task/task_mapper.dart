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
        (element) => element.name == taskOutputDto.status?.name,
        orElse: () => Status.values.first,
      ),
      deadline: taskOutputDto.deadline,
    );
  }
}