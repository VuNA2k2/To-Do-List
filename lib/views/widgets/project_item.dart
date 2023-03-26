import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';

class ProjectItem extends StatelessWidget {
  ProjectItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(const ProjectDetailScreenRoute());
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorUtils.bgColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: ColorUtils.black.withOpacity(0.15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Flutter project", style: TextStyleUtils.textStyleOpenSans24W700, maxLines: 1, overflow: TextOverflow.ellipsis,),
                DropdownButton(items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text(L.current.editLabel), onTap: () {

                  },),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(L.current.deleteLabel), onTap: () {

                  },),
                ], onChanged: (value) {

                },
                  icon: const Icon(Icons.more_horiz_rounded),
                ),
              ],
            ),
            Text("data", style: TextStyleUtils.textStyleOpenSans16W400Grey78, maxLines: 2, overflow: TextOverflow.ellipsis,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorUtils.red,
                  ),
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text("80/90"),
                ),
                const Text("data"),
              ],
            ),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              barRadius: const Radius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}
