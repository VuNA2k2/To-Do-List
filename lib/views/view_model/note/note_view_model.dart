import 'package:equatable/equatable.dart';

class NoteViewModel extends Equatable {
  int id;
  int projectId;
  String title;
  String? subtitle;
  String? description;
  NoteViewModel({
    required this.id,
    required this.projectId,
    required this.title,
    this.subtitle = '',
    this.description = '',
  });

  @override
  List<Object?> get props => [id];
}