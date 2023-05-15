class ApiPath {
  static String host = "http://192.168.2.2:8000/api/v1";
  static String login = "/auth/login";

  static String tasks = "/tasks/search";

  static String searchTaskInProject(int projectId) => "$tasks/$projectId";

  static String notes = "/notes/search";

  static String projects = "/projects/search";

  static String taskDetail = "/tasks/detail";
}