import 'package:domain/domain.dart';
import 'package:todo_list/views/note/create_note/view_model/create_note_view_model.dart';

class CreateNoteMapper {
  static NoteEntity getNoteEntityFromCreateNoteViewModel(CreateNoteViewModel createNoteViewModel) {
    return NoteEntity(
      title: createNoteViewModel.title,
      subtitle: createNoteViewModel.subtitle,
      description: createNoteViewModel.description,
      projectId: createNoteViewModel.projectId,
    );
  }
}