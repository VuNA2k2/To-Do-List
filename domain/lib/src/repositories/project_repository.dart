import 'package:domain/src/entities/page.dart';
import 'package:domain/src/entities/project_entity.dart';
import 'package:domain/src/entities/search.dart';

abstract class ProjectRepository {
  Future<PageRS<ProjectEntity>> getProjects({PageRQEntity? pageRQEntity, SearchProject? search});

  Future<ProjectEntity> createProject({required ProjectEntity projectEntity});

  Future<ProjectEntity?> updateProject({required int projectId, required ProjectEntity projectEntity});

  Future<void> deleteProject({required int projectId});
}