import 'package:domain/src/entities/task_entity.dart';
import 'package:domain/src/repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository _taskRepository;

  UpdateTaskUseCase(this._taskRepository);

  Future<void> call(int id, TaskEntity taskEntity) async {
    try {
      await _taskRepository.updateTask(id: id, taskEntity: taskEntity);
    } catch (e) {
      rethrow;
    }
  }
}
