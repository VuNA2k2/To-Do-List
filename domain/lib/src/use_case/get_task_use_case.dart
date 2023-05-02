import 'package:domain/domain.dart';
import 'package:domain/src/repositories/task_repository.dart';

class GetTaskUseCase {
  final TaskRepository _taskRepository;

  GetTaskUseCase(this._taskRepository);

  Future<PageRS<TaskEntity>> call({
    PageRQEntity? pageRQEntity,
    SearchTask? searchTask,
}) async {
    return await _taskRepository.getTasks(
      pageRQEntity: pageRQEntity,
      searchTask: searchTask,
    );
  }
}