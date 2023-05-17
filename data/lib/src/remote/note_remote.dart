import 'package:data/data.dart';
import 'package:data/src/data_source/api/api_path.dart';
import 'package:data/src/remote/dto/note/note_detail_output_dto.dart';
import 'package:data/src/remote/dto/note/note_output_dto.dart';
import 'package:data/src/remote/dto/note/search_note_input_dto.dart';
import 'package:data/src/remote/response/page.dart';
import 'package:data/src/remote/response/response.dart';

class NoteRemote {
  final ApiService _apiService;
  NoteRemote(this._apiService);
  Future<Response<Page<NoteOutputDto>>> getNotes({
    PageRQ? pageRQ,
    SearchNoteInputDto? searchNote,
}) async {
    final response = await _apiService.get(
      ApiPath.notesSearch,
      queryParameters: {
        "page": pageRQ?.page,
        "size": pageRQ?.size,
        if(searchNote != null) ...searchNote.toJson(),
      },
    );
    return Response.fromJson(
      response.data,
      (json) => Page.fromJson(
        json,
        (json) => NoteOutputDto.fromJson(json),
      ),
    );
  }

  Future<Response<NoteDetailOutputDto?>> getNoteDetail({
    required int id,
  }) async {
    final response = await _apiService.get(
      ApiPath.noteDetail,
      queryParameters: {
        "id": id,
      },
    );
    return Response.fromJson(
      response.data,
      (json) => NoteDetailOutputDto.fromJson(json),
    );
  }
}