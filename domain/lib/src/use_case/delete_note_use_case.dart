import 'package:domain/src/repositories/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository _noteRepository;

  DeleteNoteUseCase(this._noteRepository);

  Future<void> call(int noteId) async {
    return await _noteRepository.deleteNote(noteId: noteId);
  }
}