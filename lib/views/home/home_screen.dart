import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/color_utils.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/utils/text_style_utils.dart';

import '../../route/route.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          DashboardScreenRoute(),
          ProjectScreenRoute(),
        ],
        appBarBuilder: (context, tabsRouter) => PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Container(
            color: ColorUtils.bgColor,
            padding: const EdgeInsets.all(16),
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
                        Icon(Icons.person_2_outlined),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Morning, VuNA",
                            style: TextStyleUtils.textStyleOpenSans20W400,
                          ),
                        ),
                        // TODO: implement icon
                        Icon(Icons.waving_hand_rounded),
                      ],
                    ),
                    // TODO: implement icon
                    Icon(Icons.notifications_active_outlined),
                  ],
                ),
                if (tabsRouter.current.name == DashboardScreenRoute.name) ...[
                  Text(
                    L.current.todayLabel,
                    style: TextStyleUtils.textStyleOpenSans22W400,
                  ),
                  Text(
                    FormatUtils.dateFormat.format(DateTime.now()),
                    style: TextStyleUtils.textStyleOpenSans20W400,
                  ),
                ] else if(tabsRouter.current.name == ProjectScreenRoute.name) ...[
                  Text(
                    L.current.projectLabel,
                    style: TextStyleUtils.textStyleOpenSans22W400,
                  ),
                ]
              ],
            ),
          ),
        ),
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Project',
                icon: Icon(
                  Icons.folder,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
