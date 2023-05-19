import 'package:data/src/data_source/api/rest_exception.dart';
import 'package:data/src/remote/dto/note/note_mapper.dart';
import 'package:data/src/remote/dto/note/search_note_input_dto.dart';
import 'package:data/src/remote/note_remote.dart';
import 'package:data/src/remote/response/page.dart';
import 'package:domain/domain.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemote _noteRemote;

  NoteRepositoryImpl(this._noteRemote);

  @override
  Future<PageRS<NoteEntity>> getNotes(
      {PageRQEntity? pageRQEntity, SearchNote? searchNote}) async {
    final res = await _noteRemote.getNotes(
      pageRQ: pageRQEntity != null ? PageMapper.fromEntity(pageRQEntity) : null,
      searchNote:
          searchNote != null ? SearchNoteInputDto.fromEntity(searchNote) : null,
    );
    if (res.error.code == "success") {
      return PageRS(
        total: res.data?.totals ?? 0,
        items: res.data?.items
                .map(NoteMapper.getNoteEntityFromNoteOutputDto)
                .toList() ??
            [],
      );
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<NoteEntity?> getNoteDetail({required int id}) async {
    final res = await _noteRemote.getNoteDetail(id: id);
    if (res.error.code == "success") {
      return NoteMapper.getNoteEntityFromNoteDetailOutputDto(res.data!);
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<NoteEntity?> createNote({required NoteEntity noteEntity}) async {
    final res = await _noteRemote.createNote(
      noteInputDto: NoteMapper.getNoteInputDtoFromNoteEntity(noteEntity),
    );
    if (res.error.code == "success") {
      return NoteMapper.getNoteEntityFromNoteDetailOutputDto(res.data!);
    }else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<NoteEntity?> updateNote(
      {required int id, required NoteEntity noteEntity}) async {
    final res = await _noteRemote.updateNote(
      id: id,
      noteInputDto: NoteMapper.getNoteInputDtoFromNoteEntity(noteEntity),
    );
    if (res.error.code == "success") {
      return NoteMapper.getNoteEntityFromNoteDetailOutputDto(res.data!);
    }else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<void> deleteNote({required int noteId}) async {
    final res = await _noteRemote.deleteNote(
      noteId: noteId,
    );
    if (res.error.code != "success") {
      throw RestException(res.error.message);
    }
  }
}
