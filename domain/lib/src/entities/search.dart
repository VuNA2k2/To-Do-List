import 'package:domain/src/entities/status.dart';

class SearchTask {
  String? title;
  Status? status;
  DateTime? deadline;
  SearchTask({
    this.title,
    this.status,
    this.deadline,
  });
}

class SearchNote {
  String? title;
  SearchNote({
    this.title,
  });
}