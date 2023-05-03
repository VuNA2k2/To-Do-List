import 'package:domain/src/entities/status.dart';

class Search {
  String? title;
  Search(
  {
    this.title,
}
      );
}

class SearchTask extends Search {
  Status? status;
  DateTime? deadline;
  SearchTask({
    super.title,
    this.status,
    this.deadline,
  });
}

class SearchNote extends Search {
  SearchNote({
    super.title,
  });
}

class SearchProject extends Search {
  SearchProject({
    super.title,
  });
}