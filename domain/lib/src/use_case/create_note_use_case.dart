import 'package:domain/domain.dart';

class CreateNoteUseCase {
  final NoteRepository _noteRepository;

  CreateNoteUseCase(this._noteRepository);

  Future<NoteEntity?> call(NoteEntity noteEntity) async {
    try {
      return await _noteRepository.createNote(noteEntity: noteEntity);
    } catch(e) {
      rethrow;
    }
  }
}