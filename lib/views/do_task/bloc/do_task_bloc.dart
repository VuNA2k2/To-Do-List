import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_mapper.dart';
import 'package:todo_list/views/task/task_detail/view_model/task_detail_view_model.dart';

part 'do_task_event.dart';

part 'do_task_state.dart';

class DoTaskBloc extends Bloc<DoTaskEvent, DoTaskState> {
  final DoTaskUseCase _doTaskUseCase = ConfigDI().injector.get();
  final GetTaskDetailUseCase _getTaskDetailUseCase = ConfigDI().injector.get();

  DoTaskBloc() : super(DoTaskInitial()) {
    on<DoTaskInitialEvent>(_initData);
    on<DoTaskStartEvent>(_startTask);
    on<DoTaskUpdateEvent>(_updateTask);
    on<DoTaskUpdateViewEvent>(_updateView);
    on<DoTaskPauseEvent>(_pauseTask);
    on<DoTaskReplayEvent>(_replayTask);
  }

  Timer? _timer;
  Timer? _timerUpdate;

  FutureOr<void> _initData(
      DoTaskInitialEvent event, Emitter<DoTaskState> emit) async {
    emit(DoTaskLoading());
    try {
      final TaskEntity? taskEntity =
          await _getTaskDetailUseCase.call(taskId: event.taskId);
      if (taskEntity != null) {
        Duration currentDoingTime =
            taskEntity.currentDoingTime ?? Duration.zero;
        int session = currentDoingTime.inSeconds ~/ (25 * 60) + 1;
        emit(DoTaskStableState(
            taskDetailViewModel:
                TaskDetailMapper.getTaskDetailViewModelFromTaskEntity(
                    taskEntity),
            session: session,
            timeOfSession: 25));
      } else {}
    } catch (e) {}
  }

  FutureOr<void> _startTask(DoTaskStartEvent event, Emitter<DoTaskState> emit) {
    if (state is DoTaskStableState) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        add(DoTaskUpdateViewEvent());
      });
      _timerUpdate = Timer.periodic(const Duration(seconds: 5), (timer) async {
        add(DoTaskUpdateEvent(
            taskDetailViewModel:
                (state as DoTaskStableState).taskDetailViewModel));
      });
    }
  }

  FutureOr<void> _updateTask(
      DoTaskUpdateEvent event, Emitter<DoTaskState> emit) async {
    if (state is DoTaskStableState) {
      final DoTaskStableState stableState = state as DoTaskStableState;
      try {
        await _doTaskUseCase.call(
            stableState.taskDetailViewModel.id,
            TaskDetailMapper.getTaskEntityFromTaskDetailMapper(
                stableState.taskDetailViewModel));
      } catch (e) {}
    }
  }

  FutureOr<void> _updateView(
      DoTaskUpdateViewEvent event, Emitter<DoTaskState> emit) {
    if (state is DoTaskStableState) {
      final DoTaskStableState stableState = state as DoTaskStableState;
      emit(DoTaskPlayingState(
          taskDetailViewModel: stableState.taskDetailViewModel
            ..currentDoingTime = Duration(
                seconds: stableState
                        .taskDetailViewModel.currentDoingTime!.inSeconds +
                    1),
          session: stableState.session,
          timeOfSession: 25));
    }
  }

  FutureOr<void> _pauseTask(DoTaskPauseEvent event, Emitter<DoTaskState> emit) {
    if (state is DoTaskStableState) {
      final DoTaskStableState stableState = state as DoTaskStableState;
      _timer?.cancel();
      _timerUpdate?.cancel();
      emit(DoTaskPauseState(
          taskDetailViewModel: stableState.taskDetailViewModel,
          session: stableState.session,
          timeOfSession: stableState.timeOfSession));
    }
  }

  FutureOr<void> _replayTask(
      DoTaskReplayEvent event, Emitter<DoTaskState> emit) {
    if (state is DoTaskStableState) {
      add(DoTaskPauseEvent());
      final DoTaskStableState stableState = state as DoTaskStableState;
      stableState.taskDetailViewModel.currentDoingTime =
          stableState.taskDetailViewModel.currentDoingTime! -
              Duration(
                  seconds: stableState
                      .taskDetailViewModel.currentDoingTime!.inSeconds
                      .remainder(1500));
      emit(DoTaskStableState(
          taskDetailViewModel: stableState.taskDetailViewModel,
          session: stableState.session,
          timeOfSession: stableState.timeOfSession));
    }
  }
}
