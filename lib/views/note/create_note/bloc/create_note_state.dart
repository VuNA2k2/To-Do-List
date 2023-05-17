part of 'create_note_bloc.dart';

@immutable
abstract class CreateNoteState {}

class CreateNoteInitial extends CreateNoteState {}

class CreateNoteLoadingState extends CreateNoteState {}

class CreateNoteStableState extends CreateNoteState {
  final List<ProjectViewModel> projectViewModels;
  final CreateNoteViewModel noteDetailViewModel;
  ProjectViewModel selectedProjectViewModel;
  CreateNoteStableState({
    required this.projectViewModels,
    required this.noteDetailViewModel,
    required this.selectedProjectViewModel,
  });
}