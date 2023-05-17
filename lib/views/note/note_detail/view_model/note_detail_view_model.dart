import 'package:todo_list/views/all_project/view_model/project_view_model.dart';

class NoteDetailViewModel {
  int id;
  String title;
  String? subtitle;
  String? description;
  ProjectViewModel projectViewModel;
  
  NoteDetailViewModel({
    required this.id,
    required this.title,
    this.subtitle,
    this.description,
    required this.projectViewModel,
  });
}