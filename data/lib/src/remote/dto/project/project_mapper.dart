import 'package:data/src/remote/dto/enum/priority.dart';
import 'package:data/src/remote/dto/enum/status.dart';
import 'package:data/src/remote/dto/project/project_input_dto.dart';
import 'package:data/src/remote/dto/project/project_output_dto.dart';
import 'package:domain/domain.dart' as domain;

class ProjectMapper {
  static domain.ProjectEntity getProjectEntityFromProjectOutputDto(ProjectOutputDto projectOutputDto) {
    return domain.ProjectEntity(
      id: projectOutputDto.id,
      name: projectOutputDto.name,
      description: projectOutputDto.description,
      status: domain.Status.values.firstWhere(
        (element) => element.name == projectOutputDto.status.name,
        orElse: () => domain.Status.values.first,
      ),
      deadline: projectOutputDto.deadline, priority: domain.Priority.values.firstWhere(
        (element) => element.name == projectOutputDto.priority.name,
        orElse: () => domain.Priority.values.first,
      ),
      progress: projectOutputDto.progress,
      countAllTask: projectOutputDto.countAllTask,
      countDoneTask: projectOutputDto.countDoneTask,
    );
  }

  static ProjectInputDto getProjectInputDtoFromProjectEntity(domain.ProjectEntity projectEntity) {
    return ProjectInputDto(
      name: projectEntity.name,
      description: projectEntity.description,
      priority: Priority.values.firstWhere(
        (element) => element.name == projectEntity.priority.name,
        orElse: () => Priority.values.first,
      ),
      deadline: projectEntity.deadline,
      status: Status.values.firstWhere(
        (element) => element.name == projectEntity.status.name,
        orElse: () => Status.values.first,
      )
    );
  }
}