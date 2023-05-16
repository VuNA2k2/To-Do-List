import 'package:data/src/remote/dto/project/project_mapper.dart';
import 'package:data/src/remote/dto/project/search_project_input_dto.dart';
import 'package:data/src/remote/project_remote.dart';
import 'package:data/src/remote/response/page.dart';
import 'package:domain/domain.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemote _projectRemote;

  ProjectRepositoryImpl(this._projectRemote);

  @override
  Future<PageRS<ProjectEntity>> getProjects(
      {PageRQEntity? pageRQEntity, SearchProject? search}) async {
    final res = await _projectRemote.getProjects(
      pageRQ: pageRQEntity != null ? PageMapper.fromEntity(pageRQEntity) : null,
      searchProjectInputDto:
          search != null ? SearchProjectInputDto.fromEntity(search) : null,
    );
    final items = res.data?.items
        .map(ProjectMapper.getProjectEntityFromProjectOutputDto)
        .toList() ??
        [];
    return PageRS(
      total: res.data?.totals ?? 0,
      items: items,
    );
  }

  @override
  Future<ProjectEntity> createProject({required ProjectEntity projectEntity}) {
    return _projectRemote.createProject(
      projectInputDto: ProjectMapper.getProjectInputDtoFromProjectEntity(
        projectEntity,
      ),
    ).then(
      (value) => ProjectMapper.getProjectEntityFromProjectOutputDto(value.data!),
    );
  }

  @override
  Future<void> deleteProject({required int projectId}) {
    return _projectRemote.deleteProject(projectId: projectId);
  }

  @override
  Future<ProjectEntity?> updateProject({required int projectId, required ProjectEntity projectEntity}) async {
    final res = await _projectRemote.updateProject(
      projectId: projectId,
      projectInputDto: ProjectMapper.getProjectInputDtoFromProjectEntity(
        projectEntity,
      ),
    );
    if(res.data != null) {
      return ProjectMapper.getProjectEntityFromProjectOutputDto(res.data!);
    }
    return null;
  }
}
