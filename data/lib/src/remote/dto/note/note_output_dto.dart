class NoteOutputDto {
  int id;
  int projectId;
  String title;
  String subtitle;
  String description;
  NoteOutputDto({
    required this.id,
    required this.projectId,
    required this.title,
    required this.subtitle,
    required this.description,
  });
  factory NoteOutputDto.fromJson(Map<String, dynamic> json) {
    return NoteOutputDto(
      id: json['id'],
      projectId: json['projectId'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
    );
  }
}