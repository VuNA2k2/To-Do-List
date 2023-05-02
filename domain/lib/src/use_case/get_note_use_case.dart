import 'package:domain/domain.dart';

class GetNoteUseCase {
  final NoteRepository _noteRepository;

  GetNoteUseCase(this._noteRepository);

  Future<PageRS<NoteEntity>> call({
    PageRQEntity? pageRQEntity,
    SearchNote? searchNote,
  }) =>
      _noteRepository.getNotes(
        pageRQEntity: pageRQEntity,
        searchNote: searchNote,
      );
}
