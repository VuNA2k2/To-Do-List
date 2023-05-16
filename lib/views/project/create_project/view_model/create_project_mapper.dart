import 'package:domain/domain.dart';
import 'package:todo_list/views/project/create_project/view_model/create_project_view_model.dart';

class CreateProjectMapper {
  static ProjectEntity getProjectEntityFromCreateProjectViewModel(CreateProjectViewModel createProjectViewModel) {
    return ProjectEntity(
      name: createProjectViewModel.title,
      description: createProjectViewModel.description,
      priority: createProjectViewModel.priority,
      deadline: createProjectViewModel.deadline,
      status: Status.TODO,
    );
  }
}