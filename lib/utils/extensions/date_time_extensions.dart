extension DateTimeExtension on DateTime {
  bool theSameDay(DateTime dateTime) {
    return (day == dateTime.day &&
        month == dateTime.month &&
        year == dateTime.year);
  }
}
