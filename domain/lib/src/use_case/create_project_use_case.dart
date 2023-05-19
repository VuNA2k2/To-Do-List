import 'package:domain/domain.dart';

class CreateProjectUseCase {
  final ProjectRepository _projectRepository;

  CreateProjectUseCase(this._projectRepository);

  Future<ProjectEntity?> call(ProjectEntity projectEntity) {
    try {
      return _projectRepository.createProject(projectEntity: projectEntity);
    } catch (e) {
      rethrow;
    }
  }
}
