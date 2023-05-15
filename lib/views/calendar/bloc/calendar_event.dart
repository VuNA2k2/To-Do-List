part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent {}

class CalendarInitialEvent extends CalendarEvent {}

class CalendarLoadMoreEvent extends CalendarEvent {}

class CalendarChangeFocusDayEvent extends CalendarEvent {
  final DateTime focusDay;
  CalendarChangeFocusDayEvent({
    required this.focusDay,
  });
}
