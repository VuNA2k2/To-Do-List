import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';
import 'package:todo_list/views/note/create_note/view_model/note_mode.dart';

part 'create_note_event.dart';
part 'create_note_state.dart';

class CreateNoteBloc extends Bloc<CreateNoteEvent, CreateNoteState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  NoteMode noteMode = NoteMode.create;
  // NoteDetailViewModel? noteDetailViewModel;
  CreateNoteBloc() : super(CreateNoteInitial()) {

  }
}
