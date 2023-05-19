import 'package:data/src/data_source/api/rest_exception.dart';
import 'package:data/src/remote/dto/task/search_task_input_dto.dart';
import 'package:data/src/remote/dto/task/task_mapper.dart';
import 'package:data/src/remote/response/page.dart';
import 'package:data/src/remote/task_remote.dart';
import 'package:domain/domain.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemote _taskRemote;

  TaskRepositoryImpl(this._taskRemote);

  @override
  Future<PageRS<TaskEntity>> getTasks(
      {PageRQEntity? pageRQEntity, SearchTask? searchTask}) async {
    final res = await _taskRemote.getTasks(
      pageRQ: pageRQEntity != null ? PageMapper.fromEntity(pageRQEntity) : null,
      searchTaskInputDto:
          searchTask != null ? SearchTaskInputDto.fromEntity(searchTask) : null,
    );
    if (res.error.code == "success") {
      return PageRS(
        total: res.data?.totals ?? 0,
        items: res.data?.items
                .map(TaskMapper.getTaskEntityFromTaskOutputDto)
                .toList() ??
            [],
      );
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<TaskEntity?> getTaskDetail({required int taskId}) async {
    final res = await _taskRemote.getTaskDetail(taskId: taskId);
    if (res.error.code == "success") {
      return TaskMapper.getTaskEntityFromTaskDetailOutputDto(res.data!);
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<PageRS<TaskEntity>> getTasksByProjectId(
      {required int projectId,
      PageRQEntity? pageRQEntity,
      SearchTask? searchTask}) async {
    final res = await _taskRemote.getTasksInProject(
      projectId: projectId,
      pageRQ: pageRQEntity != null ? PageMapper.fromEntity(pageRQEntity) : null,
      searchTaskInputDto:
          searchTask != null ? SearchTaskInputDto.fromEntity(searchTask) : null,
    );
    if (res.error.code == "success") {
      return PageRS(
        total: res.data?.totals ?? 0,
        items: res.data?.items
                .map(TaskMapper.getTaskEntityFromTaskOutputDto)
                .toList() ??
            [],
      );
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<TaskEntity?> createTask({required TaskEntity taskEntity}) async {
    final res = await _taskRemote.createTask(
      taskInputDto: TaskMapper.getTaskInputDtoFromTaskEntity(taskEntity),
    );
    if (res.error.code == "success") {
      return TaskMapper.getTaskEntityFromTaskDetailOutputDto(res.data!);
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<TaskEntity?> updateTask(
      {required int id, required TaskEntity taskEntity}) async {
    final res = await _taskRemote.updateTask(
      id: id,
      taskInputDto: TaskMapper.getTaskInputDtoFromTaskEntity(taskEntity),
    );
    if (res.error.code == "success") {
      return TaskMapper.getTaskEntityFromTaskDetailOutputDto(res.data!);
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    final res = await _taskRemote.deleteTask(taskId);
    if (res.error.code != "success") {
      throw RestException(res.error.message);
    }
  }

  Future<void> doTask(
      {required int taskId, required TaskEntity taskEntity}) async {
    final res = await _taskRemote.doTask(
      taskId: taskId,
      doTaskInputDto: TaskMapper.getDoTaskInputDtoFromTaskEntity(taskEntity),
    );
    if (res.error.code != "success") {
      throw RestException(res.error.message);
    }
  }
}
