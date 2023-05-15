import 'package:data/data.dart';
import 'package:data/src/data_source/api/api_path.dart';
import 'package:data/src/remote/dto/task/search_task_input_dto.dart';
import 'package:data/src/remote/dto/task/task_detail_output_dto.dart';
import 'package:data/src/remote/dto/task/task_output_dto.dart';
import 'package:data/src/remote/response/page.dart';
import 'package:data/src/remote/response/response.dart';

class TaskRemote {
  final ApiService _apiService;
  TaskRemote(this._apiService);
  Future<Response<Page<TaskOutputDto>>> getTasks({
    PageRQ? pageRQ,
    SearchTaskInputDto? searchTaskInputDto,
}) async {
      final response = await _apiService.get(
        ApiPath.tasks,
        queryParameters: {
          "page": pageRQ?.page,
          "size": pageRQ?.size,
          if(searchTaskInputDto != null) ...searchTaskInputDto.toJson(),
        },
      );
      return Response.fromJson(
        response.data,
        (json) => Page.fromJson(
          json,
          (json) => TaskOutputDto.fromJson(json),
        ),
      );
  }

  Future<Response<Page<TaskOutputDto>>> getTasksInProject({
    required int projectId,
    PageRQ? pageRQ,
    SearchTaskInputDto? searchTaskInputDto,
  }) async {
    final response = await _apiService.get(
      ApiPath.searchTaskInProject(projectId),
      queryParameters: {
        "page": pageRQ?.page,
        "size": pageRQ?.size,
        if(searchTaskInputDto != null) ...searchTaskInputDto.toJson(),
      },
    );
    return Response.fromJson(
      response.data,
          (json) => Page.fromJson(
        json,
            (json) => TaskOutputDto.fromJson(json),
      ),
    );
  }

  Future<Response<TaskDetailOutputDto?>> getTaskDetail({required int taskId}) async {
    final response = await _apiService.get(
      ApiPath.taskDetail,
      queryParameters: {
        "id": taskId,
      },
    );
    return Response.fromJson(
      response.data,
      (json) => TaskDetailOutputDto.fromJson(json),
    );
  }
}