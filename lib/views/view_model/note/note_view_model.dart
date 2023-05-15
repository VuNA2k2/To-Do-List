import 'package:equatable/equatable.dart';

class NoteViewModel extends Equatable {
  int? id;
  int? projectId;
  String? title;
  String? subtitle;
  String? description;
  NoteViewModel({
    this.id,
    this.projectId,
    this.title = '',
    this.subtitle = '',
    this.description = '',
  });

  @override
  List<Object?> get props => [id];
}