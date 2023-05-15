import 'package:domain/domain.dart';

class GetTaskInProjectUseCase {
  final TaskRepository _taskRepository;

  GetTaskInProjectUseCase(this._taskRepository);

  Future<PageRS<TaskEntity>> call({
    required int projectId,
    PageRQEntity? pageRQEntity,
    SearchTask? searchTask,
  }) async {
    return await _taskRepository.getTasksByProjectId(
      projectId: projectId,
      pageRQEntity: pageRQEntity,
      searchTask: searchTask,
    );
  }
}
