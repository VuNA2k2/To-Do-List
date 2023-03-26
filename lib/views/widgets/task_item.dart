import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/icon_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/circular_percent_indicator_by_color.dart';

class TaskItem extends StatelessWidget {
  TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(const TaskDetailScreenRoute());
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
              percent: 0.53,
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
                  Text(L.current.unknown, style: TextStyleUtils.textStyleOpenSans16W600,),
                  Text(L.current.unknown, style: TextStyleUtils.textStyleOpenSans13W400Grey81,),
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
                      itemCount: 3,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {
              context.navigateTo(const DoTaskScreenRoute());
            }, icon: const Icon(Icons.play_circle_rounded, size: 36, color: ColorUtils.greenOA,),),
          ],
        ),
      ),
    );
  }
}
