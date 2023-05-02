import 'package:domain/src/entities/page.dart';
import 'package:domain/src/entities/search.dart';
import 'package:domain/src/entities/task_entity.dart';

abstract class TaskRepository {
  Future<PageRS<TaskEntity>> getTasks({
    PageRQEntity? pageRQEntity,
    SearchTask? searchTask,
  });
}