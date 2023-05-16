class ApiPath {
  static String host = "http://192.168.1.55:8000/api/v1";
  static String login = "/auth/login";

  static String tasks = "/tasks";

  static String tasksSearch = "/tasks/search";

  static String searchTaskInProject(int projectId) => "$tasksSearch/$projectId";

  static String notes = "/notes/search";

  static String projects = "/projects";

  static String projectsSearch = "/projects/search";

  static String taskDetail = "/tasks/detail";
}