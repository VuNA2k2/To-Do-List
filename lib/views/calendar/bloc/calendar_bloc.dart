import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/view_model/task/task_mapper.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  ScrollController scrollController = ScrollController();

  CalendarBloc() : super(CalendarInitial()) {
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) add(CalendarLoadMoreEvent());
    });
    on<CalendarInitialEvent>(
      _initData,
    );
    on<CalendarChangeFocusDayEvent>(
      _changeFocusDay,
    );
    on<CalendarLoadMoreEvent>(
      _loadMore,
    );
  }

  int _page = 0;
  static const int _limit = 20;
  bool _hasLoad = true;
  final GetTaskUseCase _getTaskUseCase =
      ConfigDI().injector.get<GetTaskUseCase>();

  FutureOr<void> _initData(
      CalendarInitialEvent event, Emitter<CalendarState> emit) async {
    _page = 0;
    _hasLoad = true;
    if(state is CalendarLoadingState || !_hasLoad) return;
    emit(CalendarLoadingState());
    try {
      PageRS<TaskEntity> taskEntities = await _getTaskUseCase.call(
          pageRQEntity: PageRQEntity(
            page: _page,
            size: _limit,
          ),
          searchTask: SearchTask(
            deadline: DateTime.now(),
          ));
      List<TaskViewModel> taskViewModels = taskEntities.items
          .map(TaskMapper.getTaskViewModelFromTaskEntity)
          .toList();
      _page ++;
      _hasLoad = taskViewModels.length == _limit;
      emit(
        CalendarStableState(
            focusDay: DateTime.now(), taskViewModels: taskViewModels),
      );
    } catch (e) {}
  }

  FutureOr<void> _changeFocusDay(CalendarChangeFocusDayEvent event, Emitter<CalendarState> emit) async {
    _page = 0;
    _hasLoad = true;
    if(state is CalendarLoadingState || !_hasLoad) return;
    emit(CalendarLoadingState());
    try {
      PageRS<TaskEntity> taskEntities = await _getTaskUseCase.call(
          pageRQEntity: PageRQEntity(
            page: _page,
            size: _limit,
          ),
          searchTask: SearchTask(
            deadline: event.focusDay,
          ));
      List<TaskViewModel> taskViewModels = taskEntities.items
          .map(TaskMapper.getTaskViewModelFromTaskEntity)
          .toList();
      _page ++;
      _hasLoad = taskViewModels.length == _limit;
      emit(
        CalendarStableState(
            focusDay: event.focusDay, taskViewModels: taskViewModels),
      );
    } catch (e) {}
  }

  FutureOr<void> _loadMore(CalendarLoadMoreEvent event, Emitter<CalendarState> emit) async {
    if(state is CalendarLoadingState || !_hasLoad || state is CalendarLoadMoreState) return;
    emit(CalendarLoadMoreState(focusDay: (state as CalendarStableState).focusDay, taskViewModels: (state as CalendarStableState).taskViewModels));
    try {
      PageRS<TaskEntity> taskEntities = await _getTaskUseCase.call(
          pageRQEntity: PageRQEntity(
            page: _page,
            size: _limit,
          ),
          searchTask: SearchTask(
            deadline: (state as CalendarLoadMoreState).focusDay,
          ));
      List<TaskViewModel> taskViewModels = taskEntities.items
          .map(TaskMapper.getTaskViewModelFromTaskEntity)
          .toList();
      _page ++;
      _hasLoad = taskViewModels.length == _limit;
      emit(
        CalendarStableState(
            focusDay: (state as CalendarLoadMoreState).focusDay, taskViewModels: (state as CalendarLoadMoreState).taskViewModels..addAll(taskViewModels)),
      );
    } catch (e) {}
  }
}
