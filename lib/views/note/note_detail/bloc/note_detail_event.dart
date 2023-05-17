part of 'note_detail_bloc.dart';

@immutable
abstract class NoteDetailEvent {}

class NoteDetailInitialEvent extends NoteDetailEvent {
  final NoteViewModel noteViewModel;

  NoteDetailInitialEvent(this.noteViewModel);
}
