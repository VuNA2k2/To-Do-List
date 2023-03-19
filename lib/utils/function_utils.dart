import 'package:todo_list/utils/format_utils.dart';

class FunctionUtils {
  static bool isSameDay(DateTime day1, DateTime day2) {
    return FormatUtils.dateFormat.format(day1) == FormatUtils.dateFormat.format(day2);
  }
}