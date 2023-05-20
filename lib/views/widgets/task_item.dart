import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/icon_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/view_model/task/task_view_model.dart';
import 'package:todo_list/views/widgets/circular_percent_indicator_by_color.dart';

class TaskItem extends StatelessWidget {
  TaskItem({Key? key, required this.taskViewModel}) : super(key: key);
  final TaskViewModel taskViewModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router
            .navigate(TaskDetailScreenRoute(taskViewModel: taskViewModel));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorUtils.black.withOpacity(0.15),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
          color: ColorUtils.bgColor,
        ),
        child: Row(
          children: [
            CircularPercentIndicatorByColor(
              radius: 30,
              percent: (taskViewModel.progress ?? 0) / 100,
              textStyle: TextStyleUtils.textStyleOpenSans12W600,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    taskViewModel.title ?? '',
                    style: TextStyleUtils.textStyleOpenSans16W600,
                  ),
                  Text(
                    taskViewModel.subtitle ?? '',
                    style: TextStyleUtils.textStyleOpenSans13W400Grey81,
                  ),
                  SizedBox(
                    height: 15,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SvgPicture.asset(IconUtils.icPomodoroSmall);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 3,
                        );
                      },
                      itemCount: taskViewModel.numberOfPomodoro ?? 0,
                    ),
                  ),
                  if (taskViewModel.status! != Status.DONE)
                    if (taskViewModel.deadline!.isBefore(DateTime.now()))
                      Text(
                        'Overdue',
                        style: TextStyleUtils.textStyleOpenSans13W600RedOA,
                      )
                    else
                      Text(
                        'Due ${taskViewModel.deadline!.difference(DateTime.now()).inDays} days',
                        style: TextStyleUtils.textStyleOpenSans13W600RedOA,
                      )
                ],
              ),
            ),
            if (taskViewModel.status! != Status.DONE)
              IconButton(
                onPressed: () {
                  context.navigateTo(
                      DoTaskScreenRoute(taskViewModel: taskViewModel));
                },
                icon: const Icon(
                  Icons.play_circle_rounded,
                  size: 36,
                  color: ColorUtils.greenOA,
                ),
              ),
            if (taskViewModel.status! == Status.DONE)
              Text(
                'Done',
                style: TextStyleUtils.textStyleOpenSans13W600GreenOA,
              )
          ],
        ),
      ),
    );
  }
}
