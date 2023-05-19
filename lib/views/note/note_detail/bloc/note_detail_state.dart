part of 'note_detail_bloc.dart';

@immutable
abstract class NoteDetailState {}

class NoteDetailInitial extends NoteDetailState {}

class NoteDetailLoadingState extends NoteDetailState {}

class NoteDetailStableState extends NoteDetailState {
  final NoteDetailViewModel noteDetailViewModel;

  NoteDetailStableState({required this.noteDetailViewModel});
}

class NoteDetailErrorState extends NoteDetailState {
  final String message;

  NoteDetailErrorState(
    this.message,
  );
}
