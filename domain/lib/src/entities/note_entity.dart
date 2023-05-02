import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  int id;
  int projectId;
  String title;
  String subtitle;
  String description;

  NoteEntity({
    required this.id,
    required this.projectId,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  List<Object?> get props => [id];
}