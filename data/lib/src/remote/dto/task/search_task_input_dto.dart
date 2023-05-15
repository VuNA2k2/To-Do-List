import 'package:data/src/remote/dto/enum/status.dart';
import 'package:domain/domain.dart' as domain;
class SearchTaskInputDto {
  Status? status;
  String? title;
  DateTime? deadline;
  SearchTaskInputDto({
    this.status,
    this.title,
    this.deadline,
  });
  Map<String, dynamic> toJson() {
    return {
      "status": status?.name,
      "keyword": title,
      "deadline": deadline?.add(const Duration(hours: 7)).toUtc().toIso8601String()
    };
  }
  factory SearchTaskInputDto.fromEntity(domain.SearchTask searchTask) {
    return SearchTaskInputDto(
      status: searchTask.status != null ? Status.values.firstWhere(
        (element) => element.name == searchTask.status?.name,
        orElse: () => Status.values.first,
      ) : null,
      deadline: searchTask.deadline,
    );
  }
}