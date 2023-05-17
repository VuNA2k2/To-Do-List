import 'package:domain/domain.dart';
import 'package:todo_list/views/all_project/view_model/project_mapper.dart';
import 'package:todo_list/views/note/note_detail/view_model/note_detail_view_model.dart';

class NoteDetailMapper {
  static NoteDetailViewModel getNoteDetailViewModelFromNoteEntity(
      NoteEntity noteEntity) {
    return NoteDetailViewModel(
      id: noteEntity.id!,
      title: noteEntity.title,
      subtitle: noteEntity.subtitle,
      description: noteEntity.description,
      projectViewModel: ProjectMapper.getProjectViewModelFromProjectEntity(
          noteEntity.projectEntity!),
    );
  }
}
