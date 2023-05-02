import 'package:data/src/remote/dto/note/note_output_dto.dart';
import 'package:domain/domain.dart';

class NoteMapper {
  static NoteEntity getNoteEntityFromNoteOutputDto(NoteOutputDto noteOutputDto) {
    return NoteEntity(
      id: noteOutputDto.id,
      title: noteOutputDto.title,
      description: noteOutputDto.description,
      projectId: noteOutputDto.projectId,
      subtitle: noteOutputDto.subtitle,
    );
  }
}