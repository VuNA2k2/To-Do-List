import 'package:domain/domain.dart';

class CreateTaskUseCase {
  final TaskRepository _taskRepository;

  CreateTaskUseCase(this._taskRepository);

  Future<TaskEntity?> call(TaskEntity taskEntity) {
    try {
      return _taskRepository.createTask(taskEntity: taskEntity);
    } catch (e) {
      rethrow;
    }
  }
}
