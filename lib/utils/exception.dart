import 'dart:developer';

import 'package:data/data.dart';
import 'package:todo_list/languages/language.dart';

String handleException(Object e) {
  log(e.runtimeType.toString());
  switch (e.runtimeType) {
    case RestException:
      return ExceptionCode.exceptionCodes[(e as RestException).message] ??
          L.current.systemError;
    default:
      return L.current.systemError;
  }
}

abstract class ExceptionCode {
  static Map<String, String> exceptionCodes = {
    "PROJECT_NOT_FOUND": L.current.projectNotFound,
    "TASK_NOT_FOUNT": L.current.taskNotFound,
    "PROJECT_DEADLINE_IS_BEFORE_NOW": L.current.projectDeadlineIsBeforeNow,
    "TASK_DEADLINE_IS_BEFORE_NOW": L.current.taskDeadlineIsBeforeNow,
    "PROJECT_DEADLINE_IS_BEFORE_TASK_DEADLINE":
        L.current.projectDeadlineIsBeforeTaskDeadline,
    "USERID_EXISTED": L.current.userExisted,
    "USERNAME_NOT_FOUND": L.current.userNotFound,
    "USERNAME_EXISTED": L.current.usernameExisted,
    "UNAUTHORIZED": L.current.unauthorized,
    "PROJECT_STATUS_IS_TODO": L.current.projectStatusIsTodo,
    "PROJECT_STATUS_IS_DONE": L.current.projectStatusIsDone,
    "NOTE_NOT_FOUND": L.current.noteNotFound,
    "TASK_STATUS_IS_DONE": L.current.taskStatusIsDone,
    "USERNAME_OR_PASSWORD_INCORRECT": L.current.usernameOrPasswordIncorrect,
  };
}
