import 'package:domain/src/entities/note_entity.dart';
import 'package:domain/src/entities/page.dart';
import 'package:domain/src/entities/search.dart';

abstract class NoteRepository {
  Future<PageRS<NoteEntity>> getNotes(
      {PageRQEntity? pageRQEntity, SearchNote? searchNote});
  Future<NoteEntity?> getNoteDetail({
    required int id,
  });
}