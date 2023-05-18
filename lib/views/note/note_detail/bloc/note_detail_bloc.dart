import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/exception.dart';
import 'package:todo_list/views/note/note_detail/view_model/note_detail_mapper.dart';
import 'package:todo_list/views/note/note_detail/view_model/note_detail_view_model.dart';
import 'package:todo_list/views/view_model/note/note_view_model.dart';

part 'note_detail_event.dart';

part 'note_detail_state.dart';

class NoteDetailBloc extends Bloc<NoteDetailEvent, NoteDetailState> {
  NoteDetailBloc() : super(NoteDetailInitial()) {
    on<NoteDetailInitialEvent>(
      _initData,
    );
    on<NoteDetailUpdateNoteEvent>(_updateNote);
    on<NoteDetailDeleteNoteEvent>(_deleteNote);
  }

  final GetNoteDetailUseCase _getNoteDetailUseCase = ConfigDI().injector.get();
  final DeleteNoteUseCase _deleteNoteUseCase = ConfigDI().injector.get();
  FutureOr<void> _initData(
      NoteDetailInitialEvent event, Emitter<NoteDetailState> emit) async {
    emit(NoteDetailLoadingState());
    try {
      final noteDetailEntity =
          await _getNoteDetailUseCase.call(event.noteViewModel.id);
      if (noteDetailEntity != null) {
        emit(NoteDetailStableState(
            noteDetailViewModel:
                NoteDetailMapper.getNoteDetailViewModelFromNoteEntity(
                    noteDetailEntity)));
      }
    } catch (e) {
      handleException(e);
    }
  }

  FutureOr<void> _updateNote(
      NoteDetailUpdateNoteEvent event, Emitter<NoteDetailState> emit) {
    if (state is NoteDetailStableState) {
      emit(
        NoteDetailStableState(noteDetailViewModel: event.noteDetailViewModel),
      );
    }
  }

  FutureOr<void> _deleteNote(
      NoteDetailDeleteNoteEvent event, Emitter<NoteDetailState> emit) {
    if (state is NoteDetailStableState) {
      NoteDetailStableState stableState = state as NoteDetailStableState;
      emit(NoteDetailLoadingState());
      try {
        _deleteNoteUseCase.call(stableState.noteDetailViewModel.id);
      } catch (e) {

      }
    }
  }
}
