import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/views/all_project/view_model/project_mapper.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/note/create_note/view_model/create_note_mapper.dart';
import 'package:todo_list/views/note/create_note/view_model/create_note_view_model.dart';
import 'package:todo_list/views/note/create_note/view_model/note_mode.dart';
import 'package:todo_list/views/note/note_detail/view_model/note_detail_mapper.dart';
import 'package:todo_list/views/note/note_detail/view_model/note_detail_view_model.dart';

part 'create_note_event.dart';
part 'create_note_state.dart';

class CreateNoteBloc extends Bloc<CreateNoteEvent, CreateNoteState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  NoteMode noteMode = NoteMode.create;
  NoteDetailViewModel? noteDetailViewModel;

  final CreateNoteUseCase _createNoteUseCase =
      ConfigDI().injector.get<CreateNoteUseCase>();

  CreateNoteBloc({required this.noteMode, this.noteDetailViewModel})
      : super(CreateNoteInitial()) {
    on<CreateNoteInitialEvent>(_initData);
    on<CreateNoteChangeProjectEvent>(_changeProject);
    on<CreateNoteSaveEvent>(_saveNote);
  }

  final GetProjectUseCase _getProjectUseCase =
      ConfigDI().injector.get<GetProjectUseCase>();

  FutureOr<void> _initData(
      CreateNoteInitialEvent event, Emitter<CreateNoteState> emit) async {
    emit(CreateNoteLoadingState());
    try {
      final PageRS<ProjectEntity> projectRS = await _getProjectUseCase.call();
      final List<ProjectViewModel> projectViewModels = projectRS.items
          .map(ProjectMapper.getProjectViewModelFromProjectEntity)
          .toList();
      if (noteMode == NoteMode.create) {
        emit(CreateNoteStableState(
          projectViewModels: projectViewModels,
          noteDetailViewModel: CreateNoteViewModel(
            title: '',
            subtitle: '',
            description: '',
            projectId: projectViewModels.first.id,
          ),
          selectedProjectViewModel: projectViewModels.first,
        ));
      } else {
        if (noteDetailViewModel != null) {
          final ProjectViewModel selectedProjectViewModel =
              projectViewModels.firstWhere((element) =>
                  element.id == noteDetailViewModel!.projectViewModel.id);
          titleController.text = noteDetailViewModel!.title;
          subtitleController.text = noteDetailViewModel!.subtitle ?? '';
          descriptionController.text = noteDetailViewModel!.description ?? '';
          emit(CreateNoteStableState(
            projectViewModels: projectViewModels,
            noteDetailViewModel: CreateNoteViewModel.fromNoteDetailViewModel(
                noteDetailViewModel!),
            selectedProjectViewModel: selectedProjectViewModel,
          ));
        }
      }
    } catch (e) {}
  }

  FutureOr<void> _saveNote(
      CreateNoteSaveEvent event, Emitter<CreateNoteState> emit) async {
    if (state is CreateNoteStableState) {
      if(titleController.text.isEmpty) {
        return;
      }
      CreateNoteViewModel createNoteViewModel = (state as CreateNoteStableState).noteDetailViewModel;
      createNoteViewModel.title = titleController.text;
      createNoteViewModel.subtitle = subtitleController.text;
      createNoteViewModel.description = descriptionController.text;
      try {
        if(noteMode == NoteMode.create) {
          final noteEntity = await _createNoteUseCase.call(
            CreateNoteMapper.getNoteEntityFromCreateNoteViewModel(
              createNoteViewModel,
            ),
          );
          if(noteEntity != null) {
            noteMode = NoteMode.edit;
            noteDetailViewModel = NoteDetailMapper.getNoteDetailViewModelFromNoteEntity(noteEntity);
          }
        } else if(noteDetailViewModel != null) {
          _createNoteUseCase.call(
            CreateNoteMapper.getNoteEntityFromCreateNoteViewModel(
              createNoteViewModel,
            ),
          );
        }
      } catch(e) {
        log("Error: $e");
      }
    }
  }

  FutureOr<void> _changeProject(
      CreateNoteChangeProjectEvent event, Emitter<CreateNoteState> emit) {
    if (state is CreateNoteStableState) {
      final CreateNoteStableState stableState = state as CreateNoteStableState;
      emit(
        CreateNoteStableState(
          projectViewModels: stableState.projectViewModels,
          noteDetailViewModel: stableState.noteDetailViewModel
            ..projectId = event.projectViewModel.id,
          selectedProjectViewModel: event.projectViewModel,
        ),
      );
    }
  }
}
