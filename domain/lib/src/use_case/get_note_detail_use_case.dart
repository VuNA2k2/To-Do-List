import 'package:domain/domain.dart';
import 'package:domain/src/repositories/note_repository.dart';

class GetNoteDetailUseCase {
  final NoteRepository _noteRepository;

  GetNoteDetailUseCase(this._noteRepository);

  Future<NoteEntity?> call(int noteId) {
    try {
      return _noteRepository.getNoteDetail(id: noteId);
    } catch(e) {
      rethrow;
    }
  }
}