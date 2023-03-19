
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/task_item.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  DateTime _focusDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  Widget _body(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _focusDay,
          firstDay: DateTime(2000, 1, 1),
          lastDay: DateTime(2030, 12, 31),
          selectedDayPredicate: (day) => isSameDay(day, _focusDay),
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          formatAnimationDuration: const Duration(milliseconds: 300),
          calendarFormat: _calendarFormat,
          onDaySelected: (day, selectDay) {
            setState(() {
              _focusDay = day;
            });
          },
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              final text = DateFormat.E().format(day);
              return Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: TextStyleUtils.textStyleOpenSans15W500,
                ),
              );
            },
            todayBuilder: (context, day, focusDay) {
              final text = DateFormat.d().format(day);
              return Container(
                margin: const EdgeInsets.all(4),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: TextStyleUtils.textStyleOpenSans15W500,
                    ),
                  ),
                ),
              );
            },
            selectedBuilder: (context, day, _) {
              final text = DateFormat.d().format(day);
              return Container(
                margin: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorUtils.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  text,
                  style: TextStyleUtils.textStyleOpenSans15W500,
                ),
              );
            },
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return TaskItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
