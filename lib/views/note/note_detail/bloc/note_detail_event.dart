part of 'note_detail_bloc.dart';

@immutable
abstract class NoteDetailEvent {}

class NoteDetailInitialEvent extends NoteDetailEvent {
  final NoteViewModel noteViewModel;

  NoteDetailInitialEvent(this.noteViewModel);
}

class NoteDetailUpdateNoteEvent extends NoteDetailEvent {
  final NoteDetailViewModel noteDetailViewModel;

  NoteDetailUpdateNoteEvent({required this.noteDetailViewModel});
}

class NoteDetailDeleteNoteEvent extends NoteDetailEvent {
  final NoteDetailViewModel noteDetailViewModel;

  NoteDetailDeleteNoteEvent({required this.noteDetailViewModel});
}