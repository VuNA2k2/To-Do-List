import 'package:auto_route/annotations.dart';

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
          initial: true,
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
  ],
)
class $AppRouter {}
