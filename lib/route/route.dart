import 'package:auto_route/annotations.dart';
import 'package:todo_list/views/fill_profile/fill_profile_screen.dart';
import 'package:todo_list/views/today_task/today_task_screen.dart';

import '../views/project/project_screen.dart';
import '../views/dashboard/dashboard_screen.dart';
import '../views/home/home_screen.dart';
import '../views/login/login_screen.dart';
import '../views/sign_up/sign_up_screen.dart';
import '../views/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: SplashScreen,
      initial: true,
    ),
    MaterialRoute(
      page: HomeScreen,
      children: [
        MaterialRoute(
          page: DashboardScreen,
          initial: true
        ),
        MaterialRoute(
          page: ProjectScreen,
        ),
      ],
    ),
    MaterialRoute(
      page: LoginScreen,
    ),
    MaterialRoute(
      page: SignUpScreen,
    ),
    MaterialRoute(
      page: FillProfileScreen,
    ),
    MaterialRoute(page: TodayTaskScreen,),
  ],
)
class $AppRouter {}
