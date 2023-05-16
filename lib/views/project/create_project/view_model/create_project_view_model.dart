import 'package:domain/domain.dart';

class CreateProjectViewModel {
  String title;
  String? description;
  Priority priority;
  DateTime deadline;
  CreateProjectViewModel({
    required this.title,
    this.description,
    required this.priority,
    required this.deadline,
  });
}