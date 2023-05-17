

import 'package:domain/src/entities/project_entity.dart';
import 'package:domain/src/repositories/project_repository.dart';

class UpdateProjectUseCase {
  final ProjectRepository _projectRepository;

  UpdateProjectUseCase(this._projectRepository);

  Future<ProjectEntity?> call(int projectId, ProjectEntity projectEntity) => _projectRepository.updateProject(projectId: projectId, projectEntity: projectEntity);

}