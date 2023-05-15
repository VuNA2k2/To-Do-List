import 'package:data/src/remote/dto/project/project_output_dto.dart';
import 'package:domain/domain.dart';

class ProjectMapper {
  static ProjectEntity getProjectEntityFromProjectOutputDto(ProjectOutputDto projectOutputDto) {
    return ProjectEntity(
      id: projectOutputDto.id,
      name: projectOutputDto.name,
      description: projectOutputDto.description,
      status: Status.values.firstWhere(
        (element) => element.name == projectOutputDto.status.name,
        orElse: () => Status.values.first,
      ),
      deadline: projectOutputDto.deadline, priority: Priority.values.firstWhere(
        (element) => element.name == projectOutputDto.priority.name,
        orElse: () => Priority.values.first,
      ),
      progress: projectOutputDto.progress,
      countAllTask: projectOutputDto.countAllTask,
      countDoneTask: projectOutputDto.countDoneTask,
    );
  }
}