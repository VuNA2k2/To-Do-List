import 'package:domain/domain.dart';

class CreateNoteUseCase {
  final NoteRepository _noteRepository;

  CreateNoteUseCase(this._noteRepository);

  Future<NoteEntity?> call(NoteEntity noteEntity) async {
    return await _noteRepository.createNote(noteEntity: noteEntity);
  }
}