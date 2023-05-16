import 'package:domain/src/repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase(this._taskRepository);

  Future<void> call(int taskId) async {
    return _taskRepository.deleteTask(taskId);
  }
}
