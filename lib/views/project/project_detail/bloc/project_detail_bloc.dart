import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/view_model/task/task_mapper.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';

part 'project_detail_event.dart';
part 'project_detail_state.dart';

class ProjectDetailBloc extends Bloc<ProjectDetailEvent, ProjectDetailState> {
  ProjectDetailBloc() : super(ProjectDetailInitial()) {
    on<ProjectDetailInitialEvent>(
      _initData,
    );
  }
  static const int _limit = 20;
  int _page = 0;
  bool _hasLoad = true;
  final GetTaskInProjectUseCase _getTaskInProjectUseCase = ConfigDI().injector.get();
  FutureOr<void> _initData(ProjectDetailInitialEvent event, Emitter<ProjectDetailState> emit) async {
    _page = 0;
    _hasLoad = true;
    emit(ProjectDetailLoadingState());
    final List<TaskViewModel> taskViewModels = [];
    try {
      final PageRS<TaskEntity> pageRSDone = await _getTaskInProjectUseCase.call(
        searchTask: SearchTask(
          status: Status.DONE,
        ),
        pageRQEntity: PageRQEntity(size: _limit, page: _page),
        projectId: event.projectViewModel.id,
      );

      final PageRS<TaskEntity> pageRS = await _getTaskInProjectUseCase.call(
        pageRQEntity: PageRQEntity(size: _limit, page: _page),
        projectId: event.projectViewModel.id,
      );
      _page++;
      _hasLoad = pageRS.total == _limit;
      taskViewModels.addAll(pageRS.items.map(TaskMapper.getTaskViewModelFromTaskEntity));
      ProjectViewModel projectViewModel = event.projectViewModel;
      // projectViewModel.countDoneTask = pageRSDone.total;
      // projectViewModel.countAllTask = pageRS.total;
      // projectViewModel.progress = pageRS.total == 0 ? 0 : (pageRSDone.total / pageRS.total) * 100;
      emit(ProjectDetailStableState(
        projectViewModel: projectViewModel,
        taskViewModels: taskViewModels,
      ));
    } catch (e) {

    }
  }
}
