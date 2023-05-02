import 'package:domain/domain.dart';

class SearchNoteInputDto {
  String? title;

  SearchNoteInputDto({
    this.title,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
      };

  factory SearchNoteInputDto.fromEntity(SearchNote searchNote) {
    return SearchNoteInputDto(
      title: searchNote.title,
    );
  }
}
