import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../route/route.gr.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.message,}) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashboardScreenRoute(),
        ProjectScreenRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home,),),
            BottomNavigationBarItem(label: 'Project', icon: Icon(Icons.folder,),),
          ],
        );
      },
    );
  }
}
