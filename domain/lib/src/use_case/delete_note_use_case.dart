import 'package:domain/src/repositories/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository _noteRepository;

  DeleteNoteUseCase(this._noteRepository);

  Future<void> call(int noteId) async {
    try {
      return await _noteRepository.deleteNote(noteId: noteId);
    } catch(e) {
      rethrow;
    }
  }
}