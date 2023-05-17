import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
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
  }
  final GetNoteDetailUseCase _getNoteDetailUseCase = ConfigDI().injector.get();
  FutureOr<void> _initData(NoteDetailInitialEvent event, Emitter<NoteDetailState> emit) async {
    emit(NoteDetailLoadingState());
    try {
      final noteDetailEntity = await _getNoteDetailUseCase.call(event.noteViewModel.id);
      if(noteDetailEntity != null) {
        emit(NoteDetailStableState(noteDetailViewModel: NoteDetailMapper.getNoteDetailViewModelFromNoteEntity(noteDetailEntity)));
      }
    } catch (e) {

    }
  }
}
