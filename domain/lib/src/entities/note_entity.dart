import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  int id;
  int projectId;
  ProjectEntity? projectEntity;
  String title;
  String? subtitle;
  String? description;

  NoteEntity({
    required this.id,
    required this.projectId,
    this.projectEntity,
    required this.title,
    this.subtitle,
    this.description,
  });

  @override
  List<Object?> get props => [id];
}