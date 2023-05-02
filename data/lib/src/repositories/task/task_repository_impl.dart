import 'package:data/src/remote/dto/task/search_task_input_dto.dart';
import 'package:data/src/remote/dto/task/task_mapper.dart';
import 'package:data/src/remote/response/page.dart';
import 'package:data/src/remote/task_remote.dart';
import 'package:domain/domain.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemote _taskRemote;
  TaskRepositoryImpl(this._taskRemote);
  @override
  Future<PageRS<TaskEntity>> getTasks({PageRQEntity? pageRQEntity, SearchTask? searchTask}) async {
    final res = await _taskRemote.getTasks(
      pageRQ: pageRQEntity != null ? PageMapper.fromEntity(pageRQEntity) : null,
      searchTaskInputDto: searchTask != null ? SearchTaskInputDto.fromEntity(searchTask) : null,
    );
    return PageRS(
      total: res.data?.totals ?? 0,
      items: res.data?.items.map(TaskMapper.getTaskEntityFromTaskOutputDto).toList() ?? [],
    );
  }
}