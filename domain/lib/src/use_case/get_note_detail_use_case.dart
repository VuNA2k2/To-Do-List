import 'package:domain/domain.dart';
import 'package:domain/src/repositories/note_repository.dart';

class GetNoteDetailUseCase {
  final NoteRepository _noteRepository;

  GetNoteDetailUseCase(this._noteRepository);

  Future<NoteEntity?> call(int noteId) => _noteRepository.getNoteDetail(id: noteId);
}