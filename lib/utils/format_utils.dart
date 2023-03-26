import 'package:intl/intl.dart';

class FormatUtils {
  static DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  static DateFormat dateTimeFormat = DateFormat("HH:mm dd/MM/yyyy");

  static String percentFormat(double percent, [int? width]) {
    return percent.toStringAsFixed(percent.truncateToDouble() == percent ? 0 : width ?? 1);
  }
}