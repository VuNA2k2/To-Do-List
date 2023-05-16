import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/view_model/task/task_mapper.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';

part 'project_detail_event.dart';
part 'project_detail_state.dart';

class ProjectDetailBloc extends Bloc<ProjectDetailEvent, ProjectDetailState> {
  final ScrollController scrollController = ScrollController();

  ProjectDetailBloc() : super(ProjectDetailInitial()) {
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        add(ProjectDetailLoadMoreEvent());
      }
    });
    on<ProjectDetailInitialEvent>(
      _initData,
    );
    on<ProjectDetailLoadMoreEvent>(
      _loadMore,
    );
  }
  static const int _limit = 20;
  int _page = 0;
  bool _hasLoad = true;
  final GetTaskInProjectUseCase _getTaskInProjectUseCase = ConfigDI().injector.get();
  FutureOr<void> _initData(ProjectDetailInitialEvent event, Emitter<ProjectDetailState> emit) async {
    _page = 0;
    _hasLoad = true;
    emit(ProjectDetailStableState(
      projectViewModel: event.projectViewModel,
      taskViewModels: [],
    ));
    final List<TaskViewModel> taskViewModels = [];
    // try {
      final PageRS<TaskEntity> pageRS = await _getTaskInProjectUseCase.call(
        pageRQEntity: PageRQEntity(size: _limit, page: _page),
        projectId: event.projectViewModel.id,
      );
      _page++;
      _hasLoad = pageRS.total == _limit;
      taskViewModels.addAll(pageRS.items.map(TaskMapper.getTaskViewModelFromTaskEntity));
      emit(ProjectDetailStableState(
        projectViewModel: event.projectViewModel,
        taskViewModels: taskViewModels,
      ));
    // } catch (e) {
    //   log("$e");
    // }
  }

  FutureOr<void> _loadMore(ProjectDetailLoadMoreEvent event, Emitter<ProjectDetailState> emit) async {
    if(state is ProjectDetailLoadMoreState || !_hasLoad || state is ProjectDetailLoadingState) return;
    emit(ProjectDetailLoadMoreState(
      projectViewModel: (state as ProjectDetailStableState).projectViewModel,
      taskViewModels: (state as ProjectDetailStableState).taskViewModels,
    ));
    try {
      final PageRS<TaskEntity> pageRS = await _getTaskInProjectUseCase.call(
        pageRQEntity: PageRQEntity(size: _limit, page: _page),
        projectId: (state as ProjectDetailLoadMoreState).projectViewModel.id,
      );
      _page++;
      _hasLoad = pageRS.total == _limit;
      final List<TaskViewModel> taskViewModels = (state as ProjectDetailLoadMoreState).taskViewModels;
      taskViewModels.addAll(pageRS.items.map(TaskMapper.getTaskViewModelFromTaskEntity));
      emit(ProjectDetailStableState(
        projectViewModel: (state as ProjectDetailLoadMoreState).projectViewModel,
        taskViewModels: taskViewModels,
      ));
    } catch(e) {

    }
  }
}
