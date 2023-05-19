import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/exception.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_mapper.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_view_model.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';

part 'task_detail_event.dart';
part 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc() : super(TaskDetailInitial()) {
    on<TaskDetailInitialEvent>(
      _initData,
    );
    on<TaskDetailDeleteEvent>(
      _deleteTask,
    );
  }
  final GetTaskDetailUseCase _getTaskDetailUseCase = ConfigDI().injector.get<GetTaskDetailUseCase>();
  final DeleteTaskUseCase _deleteTaskUseCase = ConfigDI().injector.get<DeleteTaskUseCase>();
  FutureOr<void> _initData(TaskDetailInitialEvent event, Emitter<TaskDetailState> emit) async {
    emit(TaskDetailLoadingState());
    try {
      final TaskEntity? taskEntity = await _getTaskDetailUseCase.call(taskId: event.taskViewModel.id ?? 0);
      if (taskEntity != null) {
        emit(TaskDetailStableState(taskDetailViewModel: TaskDetailMapper.getTaskDetailViewModelFromTaskEntity(taskEntity)..progress = event.taskViewModel.progress ?? 0.0));
      }
    } catch (e) {
      final message = handleException(e);
      emit(TaskDetailErrorState(message));
    }
  }

  FutureOr<void> _deleteTask(TaskDetailDeleteEvent event, Emitter<TaskDetailState> emit) {
    emit(TaskDetailLoadingState());
    try {
      _deleteTaskUseCase.call(event.taskDetailViewModel.id);
    } catch (e) {
      final message = handleException(e);
      emit(TaskDetailErrorState(message));
    }
  }
}
