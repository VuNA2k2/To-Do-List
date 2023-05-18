
import 'package:domain/src/entities/task_entity.dart';
import 'package:domain/src/repositories/task_repository.dart';

class DoTaskUseCase {
  final TaskRepository _taskRepository;

  DoTaskUseCase(this._taskRepository);

  Future<void> call(int taskId, TaskEntity taskEntity) async {
    await _taskRepository.doTask(taskId:  taskId,taskEntity: taskEntity);
  }
}