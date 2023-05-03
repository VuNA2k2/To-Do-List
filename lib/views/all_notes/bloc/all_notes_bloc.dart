import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/dashboard/view_model/note/note_mapper.dart';
import 'package:todo_list/views/dashboard/view_model/note/note_view_model.dart';

part 'all_notes_event.dart';

part 'all_notes_state.dart';

class AllNotesBloc extends Bloc<AllNotesEvent, AllNotesState> {
  AllNotesBloc() : super(AllNotesInitialState()) {
    on<AllNotesInitialEvent>(
      _initData,
    );
    on<AllNotesLoadMoreEvent>(
      _loadMore,
    );
  }

  static const int _limit = 20;
  int page = 0;
  bool hasLoad = true;
  ScrollController scrollController = ScrollController();
  final GetNoteUseCase _getNoteUseCase =
      ConfigDI().injector.get<GetNoteUseCase>();

  FutureOr<void> _initData(
      AllNotesInitialEvent event, Emitter<AllNotesState> emit) async {
    page = 0;
    hasLoad = true;
    emit(AllNotesLoadingState());
    final PageRS<NoteEntity> noteEntities = await _getNoteUseCase.call(
      pageRQEntity: PageRQEntity(
        page: page,
        size: _limit,
      ),
    );
    final List<NoteViewModel> noteViewModels = noteEntities.items
        .map(NoteMapper.getNoteViewModelFromNoteEntity)
        .toList();
    page++;
    hasLoad = noteEntities.items.length == _limit;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        add(AllNotesLoadMoreEvent());
      }
    });
    emit(AllNotesStableState(noteViewModels: noteViewModels));
  }

  FutureOr<void> _loadMore(
      AllNotesLoadMoreEvent event, Emitter<AllNotesState> emit) async {
    if (state is! AllNotesLoadMoreState &&
        state is! AllNotesLoadingState &&
        hasLoad) {
      List<NoteViewModel> noteViewModels =
          (state as AllNotesStableState).noteViewModels;
      emit(AllNotesLoadMoreState(noteViewModels: noteViewModels));
      final PageRS<NoteEntity> noteEntities = await _getNoteUseCase.call(
        pageRQEntity: PageRQEntity(
          page: page,
          size: _limit,
        ),
      );
      noteViewModels.addAll(
          noteEntities.items.map(NoteMapper.getNoteViewModelFromNoteEntity));
      page++;
      hasLoad = noteEntities.items.length == _limit;
      emit(AllNotesStableState(noteViewModels: noteViewModels));
    }
  }
}
