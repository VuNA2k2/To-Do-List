import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/view_model/task/task_mapper.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';

part 'today_task_event.dart';

part 'today_task_state.dart';

class TodayTaskBloc extends Bloc<TodayTaskEvent, TodayTaskState> {
  TodayTaskBloc() : super(TodayTaskInitial()) {
    on<TodayTaskInitialEvent>(
      _initData,
    );
    on<TodayTaskLoadMoreEvent>(
      _loadMoreData,
    );
  }

  static const int _limit = 20;
  int page = 0;
  bool hasLoad = true;
  final GetTaskUseCase _getTaskUseCase = ConfigDI().injector.get();
  final ScrollController scrollController = ScrollController();

  FutureOr<void> _initData(
      TodayTaskInitialEvent event, Emitter<TodayTaskState> emit) async {
    emit(TodayTaskLoadingState());
    page = 0;
    hasLoad = true;
    final PageRS<TaskEntity> taskEntities = await _getTaskUseCase.call(
      pageRQEntity: PageRQEntity(
        page: page,
        size: _limit,
      ),
      searchTask: SearchTask(
        deadline: DateTime.now(),
      ),
    );
    final List<TaskViewModel> taskViewModels = taskEntities.items
        .map(TaskMapper.getTaskViewModelFromTaskEntity)
        .toList();
    page++;
    hasLoad = taskEntities.items.length == _limit;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        add(TodayTaskLoadMoreEvent());
      }
    });

    emit(TodayTaskStableState(taskViewModels: taskViewModels));
  }

  FutureOr<void> _loadMoreData(
      TodayTaskLoadMoreEvent event, Emitter<TodayTaskState> emit) async {
    if (state is! TodayTaskLoadMoreState && state is! TodayTaskLoadingState && hasLoad) {
      final List<TaskViewModel> taskViewModels =
          (state as TodayTaskStableState).taskViewModels;
      emit(TodayTaskLoadMoreState(
          taskViewModels: (state as TodayTaskStableState).taskViewModels));
      final PageRS<TaskEntity> taskEntities = await _getTaskUseCase.call(
        pageRQEntity: PageRQEntity(
          page: page,
          size: _limit,
        ),
        searchTask: SearchTask(
          deadline: DateTime.now(),
        ),
      );
      taskViewModels.addAll(
          taskEntities.items.map(TaskMapper.getTaskViewModelFromTaskEntity));
      page++;
      emit(TodayTaskStableState(taskViewModels: taskViewModels));
    }
  }
}
