part of 'all_notes_bloc.dart';

@immutable
abstract class AllNotesEvent {}

class AllNotesInitialEvent extends AllNotesEvent {}

class AllNotesLoadMoreEvent extends AllNotesEvent {}
