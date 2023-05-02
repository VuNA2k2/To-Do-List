import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/route/route.gr.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:todo_list/views/widgets/note_item.dart';
import 'package:todo_list/views/widgets/search_bar_common.dart';
import 'package:todo_list/views/widgets/task_item.dart';

import '../widgets/circular_percent_indicator_by_color.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      DashboardBloc()
        ..add(DashboardInitialEvent()),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if(state is DashboardStableState) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            children: [
              _todayProgress(context),
              SearchBarCommon(),
              _count(
                context,
                '${L.current.todayTaskLabel} (${state.countTask})',
                    () {
                  context.router.push(const TodayTaskScreenRoute());
                },
              ),
              _listTaskInDay(context),
              _count(
                context,
                '${L.current.countNoteLabel} (${state.countNote})',
                    () {
                  context.router.push(const AllNotesScreenRoute());
                },
              ),
              _staggeredGridNotes(context),
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  Widget _todayProgress(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorUtils.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: ColorUtils.bgColor,
      ),
      child: Row(
        children: [
          CircularPercentIndicatorByColor(
            radius: 60,
            percent: 0.8,
            textStyle: TextStyleUtils.textStyleOpenSans18W700,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You are doing well!",
                  style: TextStyleUtils.textStyleOpenSans20W800,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Keep it up!",
                  style: TextStyleUtils.textStyleOpenSans16W600,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "16/20 tasks is complete",
                  maxLines: 2,
                  style: TextStyleUtils.textStyleOpenSans12W300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _count(BuildContext context, String title, Function() seeAll) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: ColorUtils.bgColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: ColorUtils.black.withOpacity(0.15),
            offset: const Offset(0, 1),
            blurRadius: 4,
          )
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyleUtils.textStyleOpenSans12W400,
          ),
          TextButton(
            onPressed: seeAll,
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              L.current.seeAllLabel,
              style: TextStyleUtils.textStyleOpenSans12W600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTaskInDay(BuildContext context) {
    DashboardState state = context.select((DashboardBloc value) => value.state);
    if(state is DashboardStableState) {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return TaskItem(taskViewModel: state.taskViewModels[index]);
        },
        itemCount: state.taskViewModels.length > 5 ? 5 : state.taskViewModels.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
      );
    }
    return const SizedBox();
  }

  Widget _staggeredGridNotes(BuildContext context) {
    DashboardState state = context.select((DashboardBloc value) => value.state);
    if(state is DashboardStableState) {
      return MasonryGridView.count(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemBuilder: (context, index) {
          return NoteItem(
            noteViewModel: state.noteViewModels[index],
          );
        },
        itemCount: state.noteViewModels.length > 5 ? 5 : state.noteViewModels.length,
      );
    }
    return const SizedBox();
  }
}
