import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/views/all_project/view_model/project_mapper.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/task/create_task/view_model/create_task_mapper.dart';
import 'package:todo_list/views/task/create_task/view_model/create_task_view_model.dart';

part 'create_task_event.dart';

part 'create_task_state.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  TextEditingController deadlineController = TextEditingController();

  CreateTaskBloc() : super(CreateTaskInitial()) {
    on<CreateTaskInitialEvent>(
      _initData,
    );
    on<CreateTaskChangeDeadlineEvent>(
      _changeDeadline,
    );
    on<CreateTaskChangePriorityEvent>(
      _changePriority,
    );
    on<CreateTaskChangeProjectEvent>(
      _changeProject,
    );
    on<CreateTaskChangeNumberOfPomodoroEvent>(
      _changeNumberOfPomodoro,
    );
    on<CreateTaskSaveEvent>(
      _saveTask,
    );
  }

  final GetProjectUseCase _getProjectUseCase =
      ConfigDI().injector.get<GetProjectUseCase>();
  final CreateTaskUseCase _createTaskUseCase =
      ConfigDI().injector.get<CreateTaskUseCase>();
  FutureOr<void> _initData(
      CreateTaskInitialEvent event, Emitter<CreateTaskState> emit) async {
    emit(CreateTaskLoading());
    final PageRS<ProjectEntity> listProject =
        await _getProjectUseCase.call(search: SearchProject());
    final List<ProjectViewModel> listProjectViewModel = listProject.items
        .map(ProjectMapper.getProjectViewModelFromProjectEntity)
        .toList();
    if (listProjectViewModel.isEmpty) {
      //TODO: handle empty project
      // emit(CreateTaskEmpty());
      // return;
    }
    emit(
      CreateTaskStableState(
        listProject: listProjectViewModel,
        projectSelected: listProjectViewModel.first,
        createTaskViewModel: CreateTaskViewModel(
          title: '',
          description: '',
          subtitle: '',
          deadline: DateTime.now(),
          projectId: listProjectViewModel.first.id,
          priority: Priority.LOW,
          numberOfPomodoro: 0,
          status: Status.TODO,
        ),
      ),
    );
    add(CreateTaskChangeDeadlineEvent(DateTime.now()));
  }

  FutureOr<void> _changeDeadline(
      CreateTaskChangeDeadlineEvent event, Emitter<CreateTaskState> emit) {
    if (state is CreateTaskStableState && event.dateTime != null) {
      deadlineController.text =
          FormatUtils.dateTimeFormat.format(event.dateTime!);
      emit((state as CreateTaskStableState)
        ..createTaskViewModel.deadline = event.dateTime!);
    }
  }

  FutureOr<void> _changePriority(
      CreateTaskChangePriorityEvent event, Emitter<CreateTaskState> emit) {
    if (state is CreateTaskStableState) {
      CreateTaskStableState stableState = state as CreateTaskStableState;
      emit(
        CreateTaskStableState(
            listProject: stableState.listProject,
            createTaskViewModel: stableState.createTaskViewModel
              ..priority = event.priority,
            projectSelected: stableState.projectSelected),
      );
    }
  }

  FutureOr<void> _changeProject(
      CreateTaskChangeProjectEvent event, Emitter<CreateTaskState> emit) {
    if (state is CreateTaskStableState) {
      CreateTaskStableState stableState = state as CreateTaskStableState;
      emit(
        CreateTaskStableState(
            listProject: stableState.listProject,
            createTaskViewModel: stableState.createTaskViewModel
              ..projectId = event.projectViewModel.id,
            projectSelected: event.projectViewModel),
      );
    }
  }

  FutureOr<void> _changeNumberOfPomodoro(
      CreateTaskChangeNumberOfPomodoroEvent event,
      Emitter<CreateTaskState> emit) {
    if (state is CreateTaskStableState) {
      CreateTaskStableState stableState = state as CreateTaskStableState;
      emit(
        CreateTaskStableState(
            listProject: stableState.listProject,
            createTaskViewModel: stableState.createTaskViewModel
              ..numberOfPomodoro = event.numberOfPomodoro,
            projectSelected: stableState.projectSelected),
      );
    }
  }

  FutureOr<void> _saveTask(CreateTaskSaveEvent event, Emitter<CreateTaskState> emit) async {
    try {
      if(state is CreateTaskStableState) {
        if(titleController.text.isNotEmpty && (state as CreateTaskStableState).createTaskViewModel.numberOfPomodoro > 0) {
          CreateTaskViewModel createTaskViewModel = (state as CreateTaskStableState).createTaskViewModel;
          createTaskViewModel.title = titleController.text;
          createTaskViewModel.description = descriptionController.text;
          createTaskViewModel.subtitle = subtitleController.text;
          _createTaskUseCase.call(CreateTaskMapper.getTaskEntityFromCreateTaskViewModel(createTaskViewModel));
        }
      }
    } catch (e) {
      // emit(CreateTaskError());
    }
  }
}
