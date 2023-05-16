import 'package:domain/domain.dart';
import 'package:todo_list/views/all_project/view_model/project_view_model.dart';

class ProjectMapper {
  static ProjectViewModel getProjectViewModelFromProjectEntity(ProjectEntity project) {
    return ProjectViewModel(
      id: project.id!,
      name: project.name,
      description: project.description,
      progress: project.progress ?? 0,
      countAllTask: project.countAllTask ?? 0,
      countDoneTask: project.countDoneTask ?? 0,
    );
  }
}