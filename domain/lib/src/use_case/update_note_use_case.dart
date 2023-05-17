import 'package:domain/domain.dart';

class UpdateNoteUseCase {
  final NoteRepository _noteRepository;

  UpdateNoteUseCase(this._noteRepository);

  Future<NoteEntity?> call(int noteId, NoteEntity noteEntity) =>
      _noteRepository.updateNote(
        id: noteId,
        noteEntity: noteEntity,
      );
}
