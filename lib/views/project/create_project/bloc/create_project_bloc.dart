import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/views/all_project/view_model/project_mapper.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/project/create_project/view_model/project_mode.dart';
import 'package:todo_list/views/project/create_project/view_model/create_project_mapper.dart';
import 'package:todo_list/views/project/create_project/view_model/create_project_view_model.dart';

part 'create_project_event.dart';

part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  ProjectMode projectMode = ProjectMode.create;
  ProjectViewModel? projectViewModel;

  CreateProjectBloc({required this.projectMode, this.projectViewModel}) : super(CreateProjectInitial()) {
    on<CreateProjectInitialEvent>(_initData);
    on<CreateProjectPriorityChangedEvent>(_changePriority);
    on<CreateProjectDeadlineChangedEvent>(_changeDeadline);
    on<CreateProjectSaveEvent>(_saveProject);
  }

  final CreateProjectUseCase _createProjectUseCase =
      ConfigDI().injector.get<CreateProjectUseCase>();
  final UpdateProjectUseCase _updateProjectUseCase =
      ConfigDI().injector.get<UpdateProjectUseCase>();

  FutureOr<void> _initData(
      CreateProjectInitialEvent event, Emitter<CreateProjectState> emit) {
    if (projectMode == ProjectMode.create) {
      emit(CreateProjectStableState(
          createProjectViewModel: CreateProjectViewModel(
              title: '',
              description: '',
              deadline: DateTime.now(),
              priority: Priority.LOW)));

      deadlineController.text =
          FormatUtils.dateTimeFormat.format(DateTime.now());
    } else if(projectViewModel != null) {
      emit(CreateProjectStableState(createProjectViewModel: CreateProjectViewModel.fromProjectViewModel(projectViewModel!)));
      projectNameController.text = projectViewModel!.name;
      projectDescriptionController.text = projectViewModel!.description ?? '';
      deadlineController.text =
          FormatUtils.dateTimeFormat.format(projectViewModel!.deadline);
    }
  }

  FutureOr<void> _changePriority(CreateProjectPriorityChangedEvent event,
      Emitter<CreateProjectState> emit) {
    if (state is CreateProjectStableState) {
      emit(CreateProjectStableState(
          createProjectViewModel:
              (state as CreateProjectStableState).createProjectViewModel
                ..priority = event.priority));
    }
  }

  FutureOr<void> _changeDeadline(CreateProjectDeadlineChangedEvent event,
      Emitter<CreateProjectState> emit) {
    if (state is CreateProjectStableState) {
      emit(CreateProjectStableState(
          createProjectViewModel:
              (state as CreateProjectStableState).createProjectViewModel
                ..deadline = event.deadline));
    }
  }

  FutureOr<void> _saveProject(
      CreateProjectSaveEvent event, Emitter<CreateProjectState> emit) async {
    if (state is CreateProjectStableState) {
      CreateProjectViewModel createProjectViewModel =
          (state as CreateProjectStableState).createProjectViewModel;
      try {
      createProjectViewModel.title = projectNameController.text;
      createProjectViewModel.description = projectDescriptionController.text;
      if(projectMode == ProjectMode.create) {
        final projectEntity = await _createProjectUseCase.call(
            CreateProjectMapper.getProjectEntityFromCreateProjectViewModel(
                createProjectViewModel));
        if(projectEntity != null) {
          projectMode = ProjectMode.edit;
          projectViewModel = ProjectMapper.getProjectViewModelFromProjectEntity(projectEntity);
        }
      } else {
        final projectEntity = await _updateProjectUseCase.call(
          projectViewModel!.id,
            CreateProjectMapper.getProjectEntityFromCreateProjectViewModel(
                createProjectViewModel));
        if(projectEntity != null) {
          projectViewModel = ProjectMapper.getProjectViewModelFromProjectEntity(projectEntity);
        }
      }
      } catch (e) {
        log("CreateProjectBloc _saveProject error: $e");
      }
    }
  }
}
