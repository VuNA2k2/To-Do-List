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
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;

import '../views/all_notes/all_notes_screen.dart' as _i7;
import '../views/all_project/all_project_screen.dart' as _i16;
import '../views/calendar/calendar_screen.dart' as _i17;
import '../views/dashboard/dashboard_screen.dart' as _i15;
import '../views/do_task/do_task_screen.dart' as _i8;
import '../views/fill_profile/fill_profile_screen.dart' as _i5;
import '../views/home/home_screen.dart' as _i2;
import '../views/login/login_screen.dart' as _i3;
import '../views/note/create_note/create_note_screen.dart' as _i12;
import '../views/note/note_detail/note_detail_screen.dart' as _i11;
import '../views/profile/profile_screen.dart' as _i18;
import '../views/project/create_project/create_project_screen.dart' as _i14;
import '../views/project/project_detail/project_detail_screen.dart' as _i9;
import '../views/sign_up/sign_up_screen.dart' as _i4;
import '../views/splash_screen/splash_screen.dart' as _i1;
import '../views/task/create_task/create_task_screen.dart' as _i13;
import '../views/task/task_detail/task_detail_screen.dart' as _i10;
import '../views/today_task/today_task_screen.dart' as _i6;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpScreen(),
      );
    },
    FillProfileScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FillProfileScreen(),
      );
    },
    TodayTaskScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.TodayTaskScreen(),
      );
    },
    AllNotesScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AllNotesScreen(),
      );
    },
    DoTaskScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DoTaskScreen(),
      );
    },
    ProjectDetailScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProjectDetailScreen(),
      );
    },
    TaskDetailScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.TaskDetailScreen(),
      );
    },
    NoteDetailScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.NoteDetailScreen(),
      );
    },
    CreateNoteScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.CreateNoteScreen(),
      );
    },
    CreateTaskScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.CreateTaskScreen(),
      );
    },
    CreateProjectScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.CreateProjectScreen(),
      );
    },
    DashboardScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.DashboardScreen(),
      );
    },
    AllProjectScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.AllProjectScreen(),
      );
    },
    CalendarScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.CalendarScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileScreen(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i19.RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
          children: [
            _i19.RouteConfig(
              DashboardScreenRoute.name,
              path: '',
              parent: HomeScreenRoute.name,
            ),
            _i19.RouteConfig(
              AllProjectScreenRoute.name,
              path: 'all-project-screen',
              parent: HomeScreenRoute.name,
            ),
            _i19.RouteConfig(
              CalendarScreenRoute.name,
              path: 'calendar-screen',
              parent: HomeScreenRoute.name,
            ),
            _i19.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile-screen',
              parent: HomeScreenRoute.name,
            ),
          ],
        ),
        _i19.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i19.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        ),
        _i19.RouteConfig(
          FillProfileScreenRoute.name,
          path: '/fill-profile-screen',
        ),
        _i19.RouteConfig(
          TodayTaskScreenRoute.name,
          path: '/today-task-screen',
        ),
        _i19.RouteConfig(
          AllNotesScreenRoute.name,
          path: '/all-notes-screen',
        ),
        _i19.RouteConfig(
          DoTaskScreenRoute.name,
          path: '/do-task-screen',
        ),
        _i19.RouteConfig(
          ProjectDetailScreenRoute.name,
          path: '/project-detail-screen',
        ),
        _i19.RouteConfig(
          TaskDetailScreenRoute.name,
          path: '/task-detail-screen',
        ),
        _i19.RouteConfig(
          NoteDetailScreenRoute.name,
          path: '/note-detail-screen',
        ),
        _i19.RouteConfig(
          CreateNoteScreenRoute.name,
          path: '/create-note-screen',
        ),
        _i19.RouteConfig(
          CreateTaskScreenRoute.name,
          path: '/create-task-screen',
        ),
        _i19.RouteConfig(
          CreateProjectScreenRoute.name,
          path: '/create-project-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i19.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i19.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          path: '/home-screen',
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i19.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i19.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i5.FillProfileScreen]
class FillProfileScreenRoute extends _i19.PageRouteInfo<void> {
  const FillProfileScreenRoute()
      : super(
          FillProfileScreenRoute.name,
          path: '/fill-profile-screen',
        );

  static const String name = 'FillProfileScreenRoute';
}

/// generated route for
/// [_i6.TodayTaskScreen]
class TodayTaskScreenRoute extends _i19.PageRouteInfo<void> {
  const TodayTaskScreenRoute()
      : super(
          TodayTaskScreenRoute.name,
          path: '/today-task-screen',
        );

  static const String name = 'TodayTaskScreenRoute';
}

/// generated route for
/// [_i7.AllNotesScreen]
class AllNotesScreenRoute extends _i19.PageRouteInfo<void> {
  const AllNotesScreenRoute()
      : super(
          AllNotesScreenRoute.name,
          path: '/all-notes-screen',
        );

  static const String name = 'AllNotesScreenRoute';
}

/// generated route for
/// [_i8.DoTaskScreen]
class DoTaskScreenRoute extends _i19.PageRouteInfo<void> {
  const DoTaskScreenRoute()
      : super(
          DoTaskScreenRoute.name,
          path: '/do-task-screen',
        );

  static const String name = 'DoTaskScreenRoute';
}

/// generated route for
/// [_i9.ProjectDetailScreen]
class ProjectDetailScreenRoute extends _i19.PageRouteInfo<void> {
  const ProjectDetailScreenRoute()
      : super(
          ProjectDetailScreenRoute.name,
          path: '/project-detail-screen',
        );

  static const String name = 'ProjectDetailScreenRoute';
}

/// generated route for
/// [_i10.TaskDetailScreen]
class TaskDetailScreenRoute extends _i19.PageRouteInfo<void> {
  const TaskDetailScreenRoute()
      : super(
          TaskDetailScreenRoute.name,
          path: '/task-detail-screen',
        );

  static const String name = 'TaskDetailScreenRoute';
}

/// generated route for
/// [_i11.NoteDetailScreen]
class NoteDetailScreenRoute extends _i19.PageRouteInfo<void> {
  const NoteDetailScreenRoute()
      : super(
          NoteDetailScreenRoute.name,
          path: '/note-detail-screen',
        );

  static const String name = 'NoteDetailScreenRoute';
}

/// generated route for
/// [_i12.CreateNoteScreen]
class CreateNoteScreenRoute extends _i19.PageRouteInfo<void> {
  const CreateNoteScreenRoute()
      : super(
          CreateNoteScreenRoute.name,
          path: '/create-note-screen',
        );

  static const String name = 'CreateNoteScreenRoute';
}

/// generated route for
/// [_i13.CreateTaskScreen]
class CreateTaskScreenRoute extends _i19.PageRouteInfo<void> {
  const CreateTaskScreenRoute()
      : super(
          CreateTaskScreenRoute.name,
          path: '/create-task-screen',
        );

  static const String name = 'CreateTaskScreenRoute';
}

/// generated route for
/// [_i14.CreateProjectScreen]
class CreateProjectScreenRoute extends _i19.PageRouteInfo<void> {
  const CreateProjectScreenRoute()
      : super(
          CreateProjectScreenRoute.name,
          path: '/create-project-screen',
        );

  static const String name = 'CreateProjectScreenRoute';
}

/// generated route for
/// [_i15.DashboardScreen]
class DashboardScreenRoute extends _i19.PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(
          DashboardScreenRoute.name,
          path: '',
        );

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i16.AllProjectScreen]
class AllProjectScreenRoute extends _i19.PageRouteInfo<void> {
  const AllProjectScreenRoute()
      : super(
          AllProjectScreenRoute.name,
          path: 'all-project-screen',
        );

  static const String name = 'AllProjectScreenRoute';
}

/// generated route for
/// [_i17.CalendarScreen]
class CalendarScreenRoute extends _i19.PageRouteInfo<void> {
  const CalendarScreenRoute()
      : super(
          CalendarScreenRoute.name,
          path: 'calendar-screen',
        );

  static const String name = 'CalendarScreenRoute';
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileScreenRoute extends _i19.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile-screen',
        );

  static const String name = 'ProfileScreenRoute';
}
