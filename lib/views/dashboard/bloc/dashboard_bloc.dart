import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/view_model/note/note_mapper.dart';
import 'package:todo_list/views/view_model/note/note_view_model.dart';
import 'package:todo_list/views/view_model/task/task_mapper.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialEvent>(
      _initData,
    );
  }

  final GetTaskUseCase _getTaskUseCase = ConfigDI().injector.get();
  final GetNoteUseCase _getNoteUseCase = ConfigDI().injector.get();

  FutureOr<void> _initData(
      DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());
    final PageRS<TaskEntity> taskEntities = await _getTaskUseCase.call(
      pageRQEntity: PageRQEntity(
        page: 0,
        size: 5,
      ),
      searchTask: SearchTask(
        deadline: DateTime.now(),
      ),
    );
    final PageRS<NoteEntity> noteEntities = await _getNoteUseCase.call(
      pageRQEntity: PageRQEntity(
        page: 0,
        size: 5,
      ),
    );
    final List<NoteViewModel> noteViewModels = noteEntities.items
        .map(NoteMapper.getNoteViewModelFromNoteEntity)
        .toList();
    final List<TaskViewModel> taskViewModels = taskEntities.items
        .map(TaskMapper.getTaskViewModelFromTaskEntity)
        .toList();
    emit(DashboardStableState(
        taskViewModels: taskViewModels,
        countTask: taskEntities.total,
        noteViewModels: noteViewModels,
        countNote: noteEntities.total));
  }
}
