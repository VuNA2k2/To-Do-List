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
      searchNote: searchNote != null ? SearchNoteInputDto.fromEntity(searchNote) : null,
    );
    return PageRS(
      total: res.data?.totals ?? 0,
      items: res.data?.items.map(NoteMapper.getNoteEntityFromNoteOutputDto).toList() ?? [],
    );
  }

  @override
  Future<NoteEntity?> getNoteDetail({required int id}) async {
    final res = await _noteRemote.getNoteDetail(id: id);
    if(res.data != null) {
      return NoteMapper.getNoteEntityFromNoteDetailOutputDto(res.data!);
    }
    return null;
  }
}