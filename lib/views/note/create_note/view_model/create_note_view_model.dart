import 'package:todo_list/views/view_model/note/note_view_model.dart';

class CreateNoteViewModel {
  String title;
  String? subtile;
  String? description;
  int projectId;
  CreateNoteViewModel({
    required this.title,
    this.subtile,
    this.description,
    required this.projectId,
  });

  factory CreateNoteViewModel.fromNoteViewModel(NoteViewModel noteViewModel) {
    return CreateNoteViewModel(
      title: noteViewModel.title,
      subtile: noteViewModel.subtitle,
      description: noteViewModel.description,
      projectId: noteViewModel.projectId,
    );
  }
}