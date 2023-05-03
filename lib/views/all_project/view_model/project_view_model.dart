class ProjectViewModel {
  int id;
  String name;
  String? description;
  int? countAllTask;
  int? countDoneTask;
  double progress;
  ProjectViewModel({
    required this.id,
    required this.name,
    this.description = '',
    this.countAllTask = 0,
    this.countDoneTask = 0,
    required this.progress,
  });
}