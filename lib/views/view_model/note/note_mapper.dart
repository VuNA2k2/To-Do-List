import 'package:domain/domain.dart';
import 'package:todo_list/views/view_model/note/note_view_model.dart';


class NoteMapper {
  static NoteViewModel getNoteViewModelFromNoteEntity(
      NoteEntity noteEntity) {
    return NoteViewModel(
      id: noteEntity.id,
      projectId: noteEntity.projectId,
      title: noteEntity.title,
      subtitle: noteEntity.subtitle,
      description: noteEntity.description,
    );
  }
}