import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/exception.dart';
import 'package:todo_list/views/all_project/view_model/project_mapper.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';

part 'all_project_event.dart';

part 'all_project_state.dart';

class AllProjectBloc extends Bloc<AllProjectEvent, AllProjectState> {
  AllProjectBloc() : super(AllProjectInitial()) {
    on<AllProjectInitialEvent>(
      _initData,
    );
    on<AllProjectLoadMoreEvent>(
      _loadMore,
    );
    on<AllProjectDeleteProjectEvent>(
      _deleteProject,
    );
  }

  static const int _limit = 20;
  int page = 0;
  bool hasLoad = true;
  ScrollController scrollController = ScrollController();
  final GetProjectUseCase _getProjectUseCase = ConfigDI().injector.get();
  final DeleteProjectUseCase _deleteProjectUseCase = ConfigDI().injector.get();

  FutureOr<void> _initData(
      AllProjectInitialEvent event, Emitter<AllProjectState> emit) async {
    page = 0;
    hasLoad = true;
    emit(AllProjectLoadingState());
    try {
      final PageRS<ProjectEntity> projectEntities = await _getProjectUseCase.call(
        pageRQEntity: PageRQEntity(
          page: page,
          size: _limit,
        ),
      );
      final List<ProjectViewModel> projectViewModels = projectEntities.items
          .map(ProjectMapper.getProjectViewModelFromProjectEntity)
          .toList();
      page++;
      hasLoad = projectEntities.items.length == _limit;
      emit(AllProjectStableState(projectViewModels: projectViewModels));
    } catch (e) {
      final message = handleException(e);
      emit(AllProjectErrorState(message: message));
      emit(AllProjectInitial());
    }
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        add(AllProjectLoadMoreEvent());
      }
    });

  }

  FutureOr<void> _loadMore(
      AllProjectLoadMoreEvent event, Emitter<AllProjectState> emit) async {
    if (state is AllProjectLoadMoreState ||
        state is AllProjectLoadingState ||
        !hasLoad) return;

    List<ProjectViewModel> projectViewModels =
        (state as AllProjectStableState).projectViewModels;
    emit(AllProjectLoadMoreState(projectViewModels: projectViewModels));
    try {
      final PageRS<ProjectEntity> projectEntities = await _getProjectUseCase.call(
        pageRQEntity: PageRQEntity(
          page: page,
          size: _limit,
        ),
      );
      projectViewModels.addAll(projectEntities.items
          .map(ProjectMapper.getProjectViewModelFromProjectEntity));
      page++;
      hasLoad = projectEntities.items.length == _limit;
      emit(AllProjectStableState(projectViewModels: projectViewModels));
    } catch (e) {
      final message = handleException(e);
      emit(AllProjectErrorState(message: message));
      emit(AllProjectInitial());
    }
  }

  FutureOr<void> _deleteProject(
      AllProjectDeleteProjectEvent event, Emitter<AllProjectState> emit) {
    try {
      _deleteProjectUseCase.call(event.projectId).then((value) {
        add(AllProjectInitialEvent());
      });
    } catch (e) {
      final message = handleException(e);
      emit(AllProjectErrorState(message: message));
      emit(AllProjectInitial());
    }
  }
}
