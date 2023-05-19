import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/exception.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/views/all_project/view_model/project_mapper.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/task/create_task/view_model/create_task_mapper.dart';
import 'package:todo_list/views/task/create_task/view_model/create_task_view_model.dart';
import 'package:todo_list/views/task/create_task/view_model/task_mode.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_mapper.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_view_model.dart';

part 'create_task_event.dart';

part 'create_task_state.dart';

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  TextEditingController deadlineController = TextEditingController();
  TaskMode taskMode;
  TaskDetailViewModel? taskDetailViewModel;

  CreateTaskBloc({
    required this.taskMode,
    this.taskDetailViewModel,
  }) : super(CreateTaskInitial()) {
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
  final UpdateTaskUseCase _updateTaskUseCase =
      ConfigDI().injector.get<UpdateTaskUseCase>();

  FutureOr<void> _initData(
      CreateTaskInitialEvent event, Emitter<CreateTaskState> emit) async {
    emit(CreateTaskLoading());
    try {
      final PageRS<ProjectEntity> listProject =
          await _getProjectUseCase.call();
      final List<ProjectViewModel> listProjectViewModel = listProject.items
          .map(ProjectMapper.getProjectViewModelFromProjectEntity)
          .toList();
      if (listProjectViewModel.isEmpty) {
        //TODO: handle empty project
        // emit(CreateTaskEmpty());
        // return;
      }
      if (taskMode == TaskMode.edit && taskDetailViewModel != null) {
        emit(CreateTaskStableState(
            listProject: listProjectViewModel,
            createTaskViewModel:
                CreateTaskViewModel.fromTaskViewModel(taskDetailViewModel!),
            projectSelected: taskDetailViewModel?.project));
        titleController.text = taskDetailViewModel!.title;
        descriptionController.text = taskDetailViewModel!.description ?? '';
        subtitleController.text = taskDetailViewModel!.subtitle ?? '';
        deadlineController.text =
            FormatUtils.dateTimeFormat.format(taskDetailViewModel!.deadline);
        return;
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
    } catch (e) {
      final String message = handleException(e);
      emit(CreateTaskErrorState(message));
    }
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
          projectSelected: stableState.projectSelected,
        ),
      );
    }
  }

  FutureOr<void> _saveTask(
      CreateTaskSaveEvent event, Emitter<CreateTaskState> emit) {
    try {
      if (state is CreateTaskStableState) {
        if (titleController.text.isNotEmpty &&
            (state as CreateTaskStableState)
                    .createTaskViewModel
                    .numberOfPomodoro >
                0) {
          CreateTaskViewModel createTaskViewModel =
              (state as CreateTaskStableState).createTaskViewModel;
          createTaskViewModel.title = titleController.text;
          createTaskViewModel.description = descriptionController.text;
          createTaskViewModel.subtitle = subtitleController.text;
          if (taskMode == TaskMode.create) {
            _createTaskUseCase
                .call(CreateTaskMapper.getTaskEntityFromCreateTaskViewModel(
                    createTaskViewModel))
                .then((value) {
              if (value != null) {
                taskMode = TaskMode.edit;
                taskDetailViewModel =
                    TaskDetailMapper.getTaskDetailViewModelFromTaskEntity(
                        value);
              }
            });
          } else {
            _updateTaskUseCase.call(
                taskDetailViewModel!.id,
                CreateTaskMapper.getTaskEntityFromCreateTaskViewModel(
                    createTaskViewModel));
          }
        }
      }
    } catch (e) {
      // emit(CreateTaskError());
    }
  }
}
