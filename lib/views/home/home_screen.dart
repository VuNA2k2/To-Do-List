import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';
import 'package:todo_list/views/task/create_task/view_model/task_mode.dart';
import 'package:todo_list/views/widgets/search_bar_common.dart';

import '../../route/route.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: AutoTabsScaffold(
          routes: const [
            DashboardScreenRoute(),
            AllProjectScreenRoute(),
            CalendarScreenRoute(),
            ProfileScreenRoute()
          ],
          appBarBuilder: (context, tabsRouter) => PreferredSize(
            preferredSize: Size.fromHeight(_getHeightAppBar(tabsRouter)),
            child: _appBar(context, tabsRouter),
          ),
          backgroundColor: ColorUtils.bgColor,
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomAppBar(
              notchMargin: 10,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _bottomNavigationItem(
                        _, Icons.home, const DashboardScreenRoute()),
                    _bottomNavigationItem(
                        _, Icons.folder, const AllProjectScreenRoute()),
                    _bottomNavigationItem(
                        _, Icons.calendar_month, const CalendarScreenRoute()),
                    _bottomNavigationItem(
                        _, Icons.person, const ProfileScreenRoute()),

                  ],
                ),
              ),
            );
          },
          floatingActionButton: ExpandableFab(
            child: const Icon(Icons.add),
            backgroundColor: ColorUtils.primaryColor,
            type: ExpandableFabType.up,
            distance: 60,
            closeButtonStyle: const ExpandableFabCloseButtonStyle(
              backgroundColor: ColorUtils.primaryColor,
            ),
            children: [
              _fabChild(context, L.current.createNoteLabel, () {
                context.router.navigate(const CreateNoteScreenRoute());
              }),
              _fabChild(context, L.current.createTaskLabel, () {
                context.router.navigate(
                  CreateTaskScreenRoute(
                    taskMode: TaskMode.create,
                  ),
                );
              }),
              _fabChild(context, L.current.createProjectLabel, () {
                context.router.navigate(const CreateProjectScreenRoute());
              }),
            ],
          ),
          floatingActionButtonLocation: ExpandableFab.location,
        ),
      ),
    );
  }

  double _getHeightAppBar(TabsRouter tabsRouter) {
    if ([DashboardScreenRoute.name, CalendarScreenRoute.name]
        .any((element) => element == tabsRouter.current.name)) {
      return 100;
    } else if (tabsRouter.current.name == AllProjectScreenRoute.name) {
      return 145;
    } else {
      return 50;
    }
  }

  Widget _appBar(BuildContext context, TabsRouter tabsRouter) {
    return Container(
      color: ColorUtils.bgColor,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: split component
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TODO: implement avatar
                  const Icon(Icons.person_2_outlined),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Morning, VuNA",
                      style: TextStyleUtils.textStyleOpenSans20W400,
                    ),
                  ),
                  // TODO: implement icon
                  const Icon(Icons.waving_hand_rounded),
                ],
              ),
              // TODO: implement icon
              const Icon(Icons.notifications_active_outlined),
            ],
          ),
          if ([DashboardScreenRoute.name, CalendarScreenRoute.name]
              .any((element) => element == tabsRouter.current.name)) ...[
            Text(
              L.current.todayLabel,
              style: TextStyleUtils.textStyleOpenSans22W400,
            ),
            Text(
              FormatUtils.dateFormat.format(DateTime.now()),
              style: TextStyleUtils.textStyleOpenSans20W400,
            ),
          ] else if (tabsRouter.current.name == AllProjectScreenRoute.name) ...[
            Text(
              L.current.myProjectLabel,
              style: TextStyleUtils.textStyleOpenSans22W400,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SearchBarCommon(),
            ),
          ]
        ],
      ),
    );
  }

  Widget _bottomNavigationItem(
      BuildContext context, IconData icon, PageRouteInfo route) {
    return IconButton(
      icon: Icon(
        icon,
        color: context.tabsRouter.current.name == route.routeName
            ? ColorUtils.primaryColor
            : null,
      ),
      onPressed: () {
        context.tabsRouter.navigate(route);
      },
    );
  }

  Widget _fabChild(BuildContext context, String label,
      [Function()? onPressed]) {
    return FloatingActionButton.extended(
      heroTag: label,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: onPressed,
      label: Text(
        label,
        style: TextStyleUtils.textStyleOpenSans13W400,
      ),
      backgroundColor: ColorUtils.primaryColor,
    );
  }
}
