import 'package:data/src/remote/dto/note/note_detail_output_dto.dart';
import 'package:data/src/remote/dto/note/note_input_dto.dart';
import 'package:data/src/remote/dto/note/note_output_dto.dart';
import 'package:data/src/remote/dto/project/project_mapper.dart';
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

  static NoteEntity getNoteEntityFromNoteDetailOutputDto(NoteDetailOutputDto noteDetailOutputDto) {
    return NoteEntity(
      id: noteDetailOutputDto.id,
      title: noteDetailOutputDto.title,
      description: noteDetailOutputDto.description,
      projectId: noteDetailOutputDto.project.id,
      subtitle: noteDetailOutputDto.subtitle,
      projectEntity: ProjectMapper.getProjectEntityFromProjectOutputDto(noteDetailOutputDto.project),
    );
  }

  static NoteInputDto getNoteInputDtoFromNoteEntity(NoteEntity noteEntity) {
    return NoteInputDto(
      projectId: noteEntity.projectId,
      title: noteEntity.title,
      subtitle: noteEntity.subtitle,
      description: noteEntity.description,
    );
  }
}