// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../views/all_notes/all_notes_screen.dart' as _i7;
import '../views/all_project/all_project_screen.dart' as _i13;
import '../views/calendar/calendar_screen.dart' as _i14;
import '../views/dashboard/dashboard_screen.dart' as _i12;
import '../views/do_task/do_task_screen.dart' as _i8;
import '../views/fill_profile/fill_profile_screen.dart' as _i5;
import '../views/home/home_screen.dart' as _i2;
import '../views/login/login_screen.dart' as _i3;
import '../views/note/note_detail/note_detail_screen.dart' as _i11;
import '../views/project/project_detail/project_detail_screen.dart' as _i9;
import '../views/sign_up/sign_up_screen.dart' as _i4;
import '../views/splash_screen/splash_screen.dart' as _i1;
import '../views/task/task_detail/task_detail_screen.dart' as _i10;
import '../views/today_task/today_task_screen.dart' as _i6;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpScreen(),
      );
    },
    FillProfileScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FillProfileScreen(),
      );
    },
    TodayTaskScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.TodayTaskScreen(),
      );
    },
    AllNotesScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AllNotesScreen(),
      );
    },
    DoTaskScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DoTaskScreen(),
      );
    },
    ProjectDetailScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProjectDetailScreen(),
      );
    },
    TaskDetailScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.TaskDetailScreen(),
      );
    },
    NoteDetailScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.NoteDetailScreen(),
      );
    },
    DashboardScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DashboardScreen(),
      );
    },
    AllProjectScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.AllProjectScreen(),
      );
    },
    CalendarScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.CalendarScreen(),
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i15.RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
          children: [
            _i15.RouteConfig(
              DashboardScreenRoute.name,
              path: '',
              parent: HomeScreenRoute.name,
            ),
            _i15.RouteConfig(
              AllProjectScreenRoute.name,
              path: 'all-project-screen',
              parent: HomeScreenRoute.name,
            ),
            _i15.RouteConfig(
              CalendarScreenRoute.name,
              path: 'calendar-screen',
              parent: HomeScreenRoute.name,
            ),
          ],
        ),
        _i15.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i15.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        ),
        _i15.RouteConfig(
          FillProfileScreenRoute.name,
          path: '/fill-profile-screen',
        ),
        _i15.RouteConfig(
          TodayTaskScreenRoute.name,
          path: '/today-task-screen',
        ),
        _i15.RouteConfig(
          AllNotesScreenRoute.name,
          path: '/all-notes-screen',
        ),
        _i15.RouteConfig(
          DoTaskScreenRoute.name,
          path: '/do-task-screen',
        ),
        _i15.RouteConfig(
          ProjectDetailScreenRoute.name,
          path: '/project-detail-screen',
        ),
        _i15.RouteConfig(
          TaskDetailScreenRoute.name,
          path: '/task-detail-screen',
        ),
        _i15.RouteConfig(
          NoteDetailScreenRoute.name,
          path: '/note-detail-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i15.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i15.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          path: '/home-screen',
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i15.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i15.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i5.FillProfileScreen]
class FillProfileScreenRoute extends _i15.PageRouteInfo<void> {
  const FillProfileScreenRoute()
      : super(
          FillProfileScreenRoute.name,
          path: '/fill-profile-screen',
        );

  static const String name = 'FillProfileScreenRoute';
}

/// generated route for
/// [_i6.TodayTaskScreen]
class TodayTaskScreenRoute extends _i15.PageRouteInfo<void> {
  const TodayTaskScreenRoute()
      : super(
          TodayTaskScreenRoute.name,
          path: '/today-task-screen',
        );

  static const String name = 'TodayTaskScreenRoute';
}

/// generated route for
/// [_i7.AllNotesScreen]
class AllNotesScreenRoute extends _i15.PageRouteInfo<void> {
  const AllNotesScreenRoute()
      : super(
          AllNotesScreenRoute.name,
          path: '/all-notes-screen',
        );

  static const String name = 'AllNotesScreenRoute';
}

/// generated route for
/// [_i8.DoTaskScreen]
class DoTaskScreenRoute extends _i15.PageRouteInfo<void> {
  const DoTaskScreenRoute()
      : super(
          DoTaskScreenRoute.name,
          path: '/do-task-screen',
        );

  static const String name = 'DoTaskScreenRoute';
}

/// generated route for
/// [_i9.ProjectDetailScreen]
class ProjectDetailScreenRoute extends _i15.PageRouteInfo<void> {
  const ProjectDetailScreenRoute()
      : super(
          ProjectDetailScreenRoute.name,
          path: '/project-detail-screen',
        );

  static const String name = 'ProjectDetailScreenRoute';
}

/// generated route for
/// [_i10.TaskDetailScreen]
class TaskDetailScreenRoute extends _i15.PageRouteInfo<void> {
  const TaskDetailScreenRoute()
      : super(
          TaskDetailScreenRoute.name,
          path: '/task-detail-screen',
        );

  static const String name = 'TaskDetailScreenRoute';
}

/// generated route for
/// [_i11.NoteDetailScreen]
class NoteDetailScreenRoute extends _i15.PageRouteInfo<void> {
  const NoteDetailScreenRoute()
      : super(
          NoteDetailScreenRoute.name,
          path: '/note-detail-screen',
        );

  static const String name = 'NoteDetailScreenRoute';
}

/// generated route for
/// [_i12.DashboardScreen]
class DashboardScreenRoute extends _i15.PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(
          DashboardScreenRoute.name,
          path: '',
        );

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i13.AllProjectScreen]
class AllProjectScreenRoute extends _i15.PageRouteInfo<void> {
  const AllProjectScreenRoute()
      : super(
          AllProjectScreenRoute.name,
          path: 'all-project-screen',
        );

  static const String name = 'AllProjectScreenRoute';
}

/// generated route for
/// [_i14.CalendarScreen]
class CalendarScreenRoute extends _i15.PageRouteInfo<void> {
  const CalendarScreenRoute()
      : super(
          CalendarScreenRoute.name,
          path: 'calendar-screen',
        );

  static const String name = 'CalendarScreenRoute';
}
