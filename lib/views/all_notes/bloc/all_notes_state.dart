part of 'all_notes_bloc.dart';

@immutable
abstract class AllNotesState {}

class AllNotesInitialState extends AllNotesState {}

class AllNotesLoadingState extends AllNotesState {}

class AllNotesStableState extends AllNotesState {
  final List<NoteViewModel> noteViewModels;

  AllNotesStableState({required this.noteViewModels});
}

class AllNotesLoadMoreState extends AllNotesStableState {
  AllNotesLoadMoreState({required super.noteViewModels});
}

class AllNotesErrorState extends AllNotesState {
  final String? message;

  AllNotesErrorState({ this.message});
}
