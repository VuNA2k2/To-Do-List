import 'package:domain/src/entities/page.dart';
import 'package:domain/src/entities/project_entity.dart';
import 'package:domain/src/entities/search.dart';
import 'package:domain/src/repositories/project_repository.dart';

class GetProjectUseCase {
  final ProjectRepository _projectRepository;
  GetProjectUseCase(this._projectRepository);
  Future<PageRS<ProjectEntity>> call({PageRQEntity? pageRQEntity, SearchProject? search}) => _projectRepository.getProjects(pageRQEntity: pageRQEntity, search: search);
}