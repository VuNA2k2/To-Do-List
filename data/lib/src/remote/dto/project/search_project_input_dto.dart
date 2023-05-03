import 'package:domain/domain.dart';

class SearchProjectInputDto {
  String? title;
  SearchProjectInputDto({
    this.title,
  });
  Map<String, dynamic> toJson() {
    return {
      "keyword": title,
    };
  }

  factory SearchProjectInputDto.fromEntity(SearchProject searchProject) {
    return SearchProjectInputDto(
      title: searchProject.title,
    );
  }
}