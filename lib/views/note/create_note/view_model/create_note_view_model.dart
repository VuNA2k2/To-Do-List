import 'package:todo_list/views/note/note_detail/view_model/note_detail_view_model.dart';

class CreateNoteViewModel {
  String title;
  String? subtitle;
  String? description;
  int projectId;
  CreateNoteViewModel({
    required this.title,
    this.subtitle,
    this.description,
    required this.projectId,
  });

  factory CreateNoteViewModel.fromNoteDetailViewModel(NoteDetailViewModel noteDetailViewModel) {
    return CreateNoteViewModel(
      title: noteDetailViewModel.title,
      subtitle: noteDetailViewModel.subtitle,
      description: noteDetailViewModel.description,
      projectId: noteDetailViewModel.projectViewModel.id,
    );
  }
}