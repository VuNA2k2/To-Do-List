import 'package:data/src/remote/dto/project/project_output_dto.dart';

class NoteDetailOutputDto {
  int id;
  ProjectOutputDto project;
  String title;
  String? subtitle;
  String? description;

  NoteDetailOutputDto({
    required this.id,
    required this.project,
    required this.title,
    this.subtitle,
    this.description,
  });

  factory NoteDetailOutputDto.fromJson(Map<String, dynamic> json) {
    return NoteDetailOutputDto(
      id: json['id'],
      project: ProjectOutputDto.fromJson(json['project']),
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
    );
  }
}