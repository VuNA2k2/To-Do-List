part of 'create_note_bloc.dart';

@immutable
abstract class CreateNoteEvent {}

class CreateNoteInitialEvent extends CreateNoteEvent {
}

class CreateNoteChangeProjectEvent extends CreateNoteEvent {
  final ProjectViewModel projectViewModel;
  CreateNoteChangeProjectEvent({
    required this.projectViewModel,
  });
}

class CreateNoteSaveEvent extends CreateNoteEvent {
}


