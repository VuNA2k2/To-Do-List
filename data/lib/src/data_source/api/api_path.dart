class ApiPath {
  static String host = "http://192.168.1.53:8000/api/v1";
  static String login = "/auth/login";

  static String tasks = "/tasks";

  static String tasksSearch = "/tasks/search";

  static String refreshToken = "/auth/refresh";

  static String doTask = "/tasks/do";

  static String searchTaskInProject(int projectId) => "$tasksSearch/$projectId";

  static String notesSearch = "/notes/search";

  static String notes = "/notes";

  static String noteDetail = "/notes/detail";

  static String projects = "/projects";

  static String projectsSearch = "/projects/search";

  static String taskDetail = "/tasks/detail";
}