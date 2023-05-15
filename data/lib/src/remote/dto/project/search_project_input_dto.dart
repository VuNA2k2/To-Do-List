import 'package:domain/domain.dart' as domain;
import 'package:data/src/remote/dto/enum/status.dart';
class SearchProjectInputDto {
  String? title;
  Status? status;
  SearchProjectInputDto({
    this.title,
    this.status,
  });
  Map<String, dynamic> toJson() {
    return {
      "keyword": title,
      "status": status?.name,
    };
  }

  factory SearchProjectInputDto.fromEntity(domain.SearchProject searchProject) {
    return SearchProjectInputDto(
      title: searchProject.title,
      status: searchProject.status != null ? Status.values.firstWhere(
        (element) => element.name == searchProject.status?.name,
        orElse: () => Status.values.first,
      ) : null,
    );
  }
}