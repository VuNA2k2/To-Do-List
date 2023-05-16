import 'package:domain/domain.dart';

class CreateProjectUseCase {
  final ProjectRepository _projectRepository;

  CreateProjectUseCase(this._projectRepository);

  Future<ProjectEntity?> call(ProjectEntity projectEntity) =>
      _projectRepository.createProject(projectEntity: projectEntity);
}
