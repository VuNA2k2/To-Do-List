import 'package:domain/domain.dart';

class GetNoteUseCase {
  final NoteRepository _noteRepository;

  GetNoteUseCase(this._noteRepository);

  Future<PageRS<NoteEntity>> call({
    PageRQEntity? pageRQEntity,
    SearchNote? searchNote,
  }) {
    try {
      return _noteRepository.getNotes(
        pageRQEntity: pageRQEntity,
        searchNote: searchNote,
      );
    } catch (e) {
      rethrow;
    }
  }
}
