import 'package:domain/src/entities/page.dart';
import 'package:domain/src/entities/search.dart';
import 'package:domain/src/entities/task_entity.dart';

abstract class TaskRepository {
  Future<PageRS<TaskEntity>> getTasks({
    PageRQEntity? pageRQEntity,
    SearchTask? searchTask,
  });

  Future<PageRS<TaskEntity>> getTasksByProjectId({
    required int projectId,
    PageRQEntity? pageRQEntity,
    SearchTask? searchTask,
  });

  Future<TaskEntity?> getTaskDetail({required int taskId});

  Future<TaskEntity?> createTask({required TaskEntity taskEntity});

  Future<TaskEntity?> updateTask({required int id,required TaskEntity taskEntity});
}