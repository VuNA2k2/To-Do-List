import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/utils/icon_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/note_task_content_common.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorUtils.greenOA,
        child: const Icon(Icons.play_arrow_rounded),
      ),
      backgroundColor: ColorUtils.bgColor,
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NoteTaskContentCommon(),
                _numberOfPomodoro(context),
                _progress(context),
                _deadline(context),
                _priority(context),
              ],
            ),
          ),
        ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          context.router.navigateBack();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorUtils.black,
        ),
      ),
      title: Text(
        "Task Name",
        style: TextStyleUtils.textStyleOpenSans20W400Black,
      ),
      backgroundColor: ColorUtils.bgColor,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              // TODO: add task to project
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: ColorUtils.black,
            )),
      ],
    );
  }

  Widget _contentItem(String? label, Widget content, [Widget? widgetLabel]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: widgetLabel ??
                Text(
                  label ?? '',
                  style: TextStyleUtils.textStyleOpenSans16W600Blue05,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          const SizedBox(
            height: 6,
          ),
          Flexible(
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _numberOfPomodoro(BuildContext context) {
    return _contentItem(
      L.current.numberOfPomodoroLabel,
      Row(
        children: [
          for (int i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                IconUtils.icPomodoroSmall,
                width: 24,
                height: 24,
              ),
            ),
        ],
      ),
    );
  }

  Widget _progress(BuildContext context) {
    return _contentItem(
      null,
      LinearPercentIndicator(
        padding: EdgeInsets.zero,
        barRadius: const Radius.circular(10),
        percent: 0.8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            L.current.progressLabel,
            style: TextStyleUtils.textStyleOpenSans16W600Blue05,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '80%',
            style: TextStyleUtils.textStyleOpenSans14W300Grey75,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _deadline(BuildContext context) {
    return _contentItem(
      L.current.deadlineLabel,
      Text(
        FormatUtils.dateTimeFormat.format(DateTime.now()),
        style: TextStyleUtils.textStyleOpenSans16W400,
      ),
    );
  }

  Widget _priority(BuildContext context) {
    return _contentItem(
      L.current.priorityLabel,
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 10,
              height: 10,
              color: ColorUtils.greyED,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Low',
            style: TextStyleUtils.textStyleOpenSans16W400,
          )
        ],
      ),
    );
  }
}
