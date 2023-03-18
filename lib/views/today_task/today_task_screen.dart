import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/widgets/search_bar_common.dart';
import 'package:todo_list/views/widgets/task_item.dart';

class TodayTaskScreen extends StatelessWidget {
  const TodayTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          L.current.todayTaskLabel,
          style: TextStyleUtils.textStyleOpenSans22W400Black,
        ),
        backgroundColor: ColorUtils.bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: ColorUtils.black,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: _body(context),
      backgroundColor: ColorUtils.bgColor,
    );
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SearchBarCommon(),
            ),
            Expanded(
              child: ListView.separated(
                padding:
                const EdgeInsets.all(12),
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
        ),
      ),
    );
  }
}
