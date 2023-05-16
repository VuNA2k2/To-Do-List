import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/views/project/create_project/view_model/create_project_mapper.dart';
import 'package:todo_list/views/project/create_project/view_model/create_project_view_model.dart';

part 'create_project_event.dart';
part 'create_project_state.dart';

class CreateProjectBloc extends Bloc<CreateProjectEvent, CreateProjectState> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  CreateProjectBloc() : super(CreateProjectInitial()) {
    on<CreateProjectInitialEvent>(_initData);
    on<CreateProjectPriorityChangedEvent>(_changePriority);
    on<CreateProjectDeadlineChangedEvent>(_changeDeadline);
    on<CreateProjectSaveEvent>(_saveProject);
  }

  final CreateProjectUseCase _createProjectUseCase = ConfigDI().injector.get<CreateProjectUseCase>();

  FutureOr<void> _initData(CreateProjectInitialEvent event, Emitter<CreateProjectState> emit) {
    emit(CreateProjectStableState(createProjectViewModel: CreateProjectViewModel(title: '', description: '', deadline: DateTime.now(), priority: Priority.LOW)));
    deadlineController.text = FormatUtils.dateTimeFormat.format(DateTime.now());
  }

  FutureOr<void> _changePriority(CreateProjectPriorityChangedEvent event, Emitter<CreateProjectState> emit) {
    if(state is CreateProjectStableState) {
      emit(CreateProjectStableState(createProjectViewModel: (state as CreateProjectStableState).createProjectViewModel..priority = event.priority));
    }
  }

  FutureOr<void> _changeDeadline(CreateProjectDeadlineChangedEvent event, Emitter<CreateProjectState> emit) {
    if(state is CreateProjectStableState) {
      emit(CreateProjectStableState(createProjectViewModel: (state as CreateProjectStableState).createProjectViewModel..deadline = event.deadline));
    }
  }

  FutureOr<void> _saveProject(CreateProjectSaveEvent event, Emitter<CreateProjectState> emit) {
    if(state is CreateProjectStableState) {
      CreateProjectViewModel createProjectViewModel = (state as CreateProjectStableState).createProjectViewModel;
      // try {
        createProjectViewModel.title = projectNameController.text;
        createProjectViewModel.description = projectDescriptionController.text;
        _createProjectUseCase.call(CreateProjectMapper.getProjectEntityFromCreateProjectViewModel(createProjectViewModel));
      // } catch (e) {
      //
      // }
    }
  }
}
