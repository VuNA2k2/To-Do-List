class NoteInputDto {
  int projectId;
  String title;
  String? subtitle;
  String? description;

  NoteInputDto({
    required this.projectId,
    required this.title,
    this.subtitle,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'title': title,
      'subtitle': subtitle,
      'description': description,
    };
  }
}