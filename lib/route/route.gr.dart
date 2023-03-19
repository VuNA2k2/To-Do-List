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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../views/all_notes/all_notes_screen.dart' as _i7;
import '../views/calendar/calendar_screen.dart' as _i10;
import '../views/dashboard/dashboard_screen.dart' as _i8;
import '../views/fill_profile/fill_profile_screen.dart' as _i5;
import '../views/home/home_screen.dart' as _i2;
import '../views/login/login_screen.dart' as _i3;
import '../views/project/project_screen.dart' as _i9;
import '../views/sign_up/sign_up_screen.dart' as _i4;
import '../views/splash_screen/splash_screen.dart' as _i1;
import '../views/today_task/today_task_screen.dart' as _i6;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpScreen(),
      );
    },
    FillProfileScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FillProfileScreen(),
      );
    },
    TodayTaskScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.TodayTaskScreen(),
      );
    },
    AllNotesScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AllNotesScreen(),
      );
    },
    DashboardScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardScreen(),
      );
    },
    ProjectScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProjectScreen(),
      );
    },
    CalendarScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CalendarScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
          children: [
            _i11.RouteConfig(
              DashboardScreenRoute.name,
              path: '',
              parent: HomeScreenRoute.name,
            ),
            _i11.RouteConfig(
              ProjectScreenRoute.name,
              path: 'project-screen',
              parent: HomeScreenRoute.name,
            ),
            _i11.RouteConfig(
              CalendarScreenRoute.name,
              path: 'calendar-screen',
              parent: HomeScreenRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i11.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        ),
        _i11.RouteConfig(
          FillProfileScreenRoute.name,
          path: '/fill-profile-screen',
        ),
        _i11.RouteConfig(
          TodayTaskScreenRoute.name,
          path: '/today-task-screen',
        ),
        _i11.RouteConfig(
          AllNotesScreenRoute.name,
          path: '/all-notes-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i11.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i11.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          path: '/home-screen',
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i11.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i11.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i5.FillProfileScreen]
class FillProfileScreenRoute extends _i11.PageRouteInfo<void> {
  const FillProfileScreenRoute()
      : super(
          FillProfileScreenRoute.name,
          path: '/fill-profile-screen',
        );

  static const String name = 'FillProfileScreenRoute';
}

/// generated route for
/// [_i6.TodayTaskScreen]
class TodayTaskScreenRoute extends _i11.PageRouteInfo<void> {
  const TodayTaskScreenRoute()
      : super(
          TodayTaskScreenRoute.name,
          path: '/today-task-screen',
        );

  static const String name = 'TodayTaskScreenRoute';
}

/// generated route for
/// [_i7.AllNotesScreen]
class AllNotesScreenRoute extends _i11.PageRouteInfo<void> {
  const AllNotesScreenRoute()
      : super(
          AllNotesScreenRoute.name,
          path: '/all-notes-screen',
        );

  static const String name = 'AllNotesScreenRoute';
}

/// generated route for
/// [_i8.DashboardScreen]
class DashboardScreenRoute extends _i11.PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(
          DashboardScreenRoute.name,
          path: '',
        );

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i9.ProjectScreen]
class ProjectScreenRoute extends _i11.PageRouteInfo<void> {
  const ProjectScreenRoute()
      : super(
          ProjectScreenRoute.name,
          path: 'project-screen',
        );

  static const String name = 'ProjectScreenRoute';
}

/// generated route for
/// [_i10.CalendarScreen]
class CalendarScreenRoute extends _i11.PageRouteInfo<void> {
  const CalendarScreenRoute()
      : super(
          CalendarScreenRoute.name,
          path: 'calendar-screen',
        );

  static const String name = 'CalendarScreenRoute';
}
