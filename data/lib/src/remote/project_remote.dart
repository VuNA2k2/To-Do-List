import 'package:data/data.dart';
import 'package:data/src/data_source/api/api_path.dart';
import 'package:data/src/remote/dto/project/project_input_dto.dart';
import 'package:data/src/remote/dto/project/project_output_dto.dart';
import 'package:data/src/remote/dto/project/search_project_input_dto.dart';
import 'package:data/src/remote/response/page.dart';
import 'package:data/src/remote/response/response.dart';

class ProjectRemote {
  final ApiService _apiService;
  ProjectRemote(this._apiService);
  Future<Response<Page<ProjectOutputDto>>> getProjects({
    PageRQ? pageRQ,
  SearchProjectInputDto? searchProjectInputDto,
}) async {
    final res = await _apiService.get(
      ApiPath.projectsSearch,
      queryParameters: {
        "page": pageRQ?.page,
        "size": pageRQ?.size,
        "keyword": searchProjectInputDto?.title,
      },
    );
    return Response.fromJson(res.data, (json) => Page.fromJson(
      json,
      (json) => ProjectOutputDto.fromJson(json),
    ));
  }

  Future<Response<ProjectOutputDto>> createProject({
    required ProjectInputDto projectInputDto,
  }) async {
    final res = await _apiService.post(
      ApiPath.projects,
      data: projectInputDto.toJson(),
    );
    return Response.fromJson(res.data, (json) => ProjectOutputDto.fromJson(json));
  }

  Future<Response> deleteProject({required int projectId}) async {
    final res = await _apiService.delete(
      ApiPath.projects,
      queryParameters: {
        "id": projectId,
      },
    );
    return Response.fromJson(res.data, (json) => json);
  }

  Future<Response<ProjectOutputDto>> updateProject({
    required int projectId,
    required ProjectInputDto projectInputDto,
  }) async {
    final res = await _apiService.put(
      ApiPath.projects,
      queryParameters: {
        "id": projectId,
      },
      data: projectInputDto.toJson(),
    );
    return Response.fromJson(res.data, (json) => ProjectOutputDto.fromJson(json));
  }
}