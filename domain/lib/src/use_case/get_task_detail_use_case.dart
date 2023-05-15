import 'package:domain/src/entities/task_entity.dart';
import 'package:domain/src/repositories/task_repository.dart';

class GetTaskDetailUseCase {
  final TaskRepository _taskRepository;

  GetTaskDetailUseCase(this._taskRepository);

  Future<TaskEntity?> call({required int taskId}) async {
    return await _taskRepository.getTaskDetail(taskId: taskId);
  }
}