import 'package:domain/src/repositories/project_repository.dart';

class DeleteProjectUseCase {
  final ProjectRepository _projectRepository;

  DeleteProjectUseCase(this._projectRepository);

  Future<void> call(int id) => _projectRepository.deleteProject(projectId: id);
}
