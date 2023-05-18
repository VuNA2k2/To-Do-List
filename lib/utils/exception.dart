import 'dart:developer';

void handleException(Object e) {
  log(e.runtimeType.toString());
}

abstract class ExceptionCode {
  static const Map<String, dynamic> exceptionCodes = {
    "":"",
  };
}