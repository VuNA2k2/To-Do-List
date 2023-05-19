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
import '../views/all_project/view_model/project_view_model.dart' as _i25;
import '../views/calendar/calendar_screen.dart' as _i17;
import '../views/dashboard/dashboard_screen.dart' as _i15;
import '../views/do_task/do_task_screen.dart' as _i8;
import '../views/fill_profile/fill_profile_screen.dart' as _i5;
import '../views/fill_profile/view_model/profile_mode.dart' as _i22;
import '../views/fill_profile/view_model/user_info_view_model.dart' as _i23;
import '../views/home/home_screen.dart' as _i2;
import '../views/login/login_screen.dart' as _i3;
import '../views/note/create_note/create_note_screen.dart' as _i12;
import '../views/note/create_note/view_model/note_mode.dart' as _i27;
import '../views/note/note_detail/note_detail_screen.dart' as _i11;
import '../views/note/note_detail/view_model/note_detail_view_model.dart'
    as _i28;
import '../views/profile/profile_screen.dart' as _i18;
import '../views/project/create_project/create_project_screen.dart' as _i14;
import '../views/project/create_project/view_model/project_mode.dart' as _i31;
import '../views/project/project_detail/project_detail_screen.dart' as _i9;
import '../views/sign_up/sign_up_screen.dart' as _i4;
import '../views/sign_up/view_model/account_view_model.dart' as _i21;
import '../views/splash_screen/splash_screen.dart' as _i1;
import '../views/task/create_task/create_task_screen.dart' as _i13;
import '../views/task/create_task/view_model/task_mode.dart' as _i29;
import '../views/task/task_detail/task_detail_screen.dart' as _i10;
import '../views/task/task_detail/view_model/task_detail_view_model.dart'
    as _i30;
import '../views/today_task/today_task_screen.dart' as _i6;
import '../views/view_model/note/note_view_model.dart' as _i26;
import '../views/view_model/task/task_view_model.dart' as _i24;

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
      final args = routeData.argsAs<FillProfileScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.FillProfileScreen(
          key: args.key,
          accountViewModel: args.accountViewModel,
          profileMode: args.profileMode,
          userInfoViewModel: args.userInfoViewModel,
        ),
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
      final args = routeData.argsAs<DoTaskScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.DoTaskScreen(
          key: args.key,
          taskViewModel: args.taskViewModel,
        ),
      );
    },
    ProjectDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProjectDetailScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ProjectDetailScreen(
          key: args.key,
          projectViewModel: args.projectViewModel,
        ),
      );
    },
    TaskDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<TaskDetailScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.TaskDetailScreen(
          key: args.key,
          taskViewModel: args.taskViewModel,
        ),
      );
    },
    NoteDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NoteDetailScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.NoteDetailScreen(
          key: args.key,
          noteViewModel: args.noteViewModel,
        ),
      );
    },
    CreateNoteScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNoteScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.CreateNoteScreen(
          key: args.key,
          noteMode: args.noteMode,
          noteDetailViewModel: args.noteDetailViewModel,
        ),
      );
    },
    CreateTaskScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTaskScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.CreateTaskScreen(
          key: args.key,
          taskMode: args.taskMode,
          taskDetailViewModel: args.taskDetailViewModel,
        ),
      );
    },
    CreateProjectScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CreateProjectScreenRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.CreateProjectScreen(
          key: args.key,
          projectMode: args.projectMode,
          projectViewModel: args.projectViewModel,
        ),
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
class FillProfileScreenRoute
    extends _i19.PageRouteInfo<FillProfileScreenRouteArgs> {
  FillProfileScreenRoute({
    _i20.Key? key,
    required _i21.AccountViewModel accountViewModel,
    required _i22.ProfileMode profileMode,
    _i23.UserInfoViewModel? userInfoViewModel,
  }) : super(
          FillProfileScreenRoute.name,
          path: '/fill-profile-screen',
          args: FillProfileScreenRouteArgs(
            key: key,
            accountViewModel: accountViewModel,
            profileMode: profileMode,
            userInfoViewModel: userInfoViewModel,
          ),
        );

  static const String name = 'FillProfileScreenRoute';
}

class FillProfileScreenRouteArgs {
  const FillProfileScreenRouteArgs({
    this.key,
    required this.accountViewModel,
    required this.profileMode,
    this.userInfoViewModel,
  });

  final _i20.Key? key;

  final _i21.AccountViewModel accountViewModel;

  final _i22.ProfileMode profileMode;

  final _i23.UserInfoViewModel? userInfoViewModel;

  @override
  String toString() {
    return 'FillProfileScreenRouteArgs{key: $key, accountViewModel: $accountViewModel, profileMode: $profileMode, userInfoViewModel: $userInfoViewModel}';
  }
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
class DoTaskScreenRoute extends _i19.PageRouteInfo<DoTaskScreenRouteArgs> {
  DoTaskScreenRoute({
    _i20.Key? key,
    required _i24.TaskViewModel taskViewModel,
  }) : super(
          DoTaskScreenRoute.name,
          path: '/do-task-screen',
          args: DoTaskScreenRouteArgs(
            key: key,
            taskViewModel: taskViewModel,
          ),
        );

  static const String name = 'DoTaskScreenRoute';
}

class DoTaskScreenRouteArgs {
  const DoTaskScreenRouteArgs({
    this.key,
    required this.taskViewModel,
  });

  final _i20.Key? key;

  final _i24.TaskViewModel taskViewModel;

  @override
  String toString() {
    return 'DoTaskScreenRouteArgs{key: $key, taskViewModel: $taskViewModel}';
  }
}

/// generated route for
/// [_i9.ProjectDetailScreen]
class ProjectDetailScreenRoute
    extends _i19.PageRouteInfo<ProjectDetailScreenRouteArgs> {
  ProjectDetailScreenRoute({
    _i20.Key? key,
    required _i25.ProjectViewModel projectViewModel,
  }) : super(
          ProjectDetailScreenRoute.name,
          path: '/project-detail-screen',
          args: ProjectDetailScreenRouteArgs(
            key: key,
            projectViewModel: projectViewModel,
          ),
        );

  static const String name = 'ProjectDetailScreenRoute';
}

class ProjectDetailScreenRouteArgs {
  const ProjectDetailScreenRouteArgs({
    this.key,
    required this.projectViewModel,
  });

  final _i20.Key? key;

  final _i25.ProjectViewModel projectViewModel;

  @override
  String toString() {
    return 'ProjectDetailScreenRouteArgs{key: $key, projectViewModel: $projectViewModel}';
  }
}

/// generated route for
/// [_i10.TaskDetailScreen]
class TaskDetailScreenRoute
    extends _i19.PageRouteInfo<TaskDetailScreenRouteArgs> {
  TaskDetailScreenRoute({
    _i20.Key? key,
    required _i24.TaskViewModel taskViewModel,
  }) : super(
          TaskDetailScreenRoute.name,
          path: '/task-detail-screen',
          args: TaskDetailScreenRouteArgs(
            key: key,
            taskViewModel: taskViewModel,
          ),
        );

  static const String name = 'TaskDetailScreenRoute';
}

class TaskDetailScreenRouteArgs {
  const TaskDetailScreenRouteArgs({
    this.key,
    required this.taskViewModel,
  });

  final _i20.Key? key;

  final _i24.TaskViewModel taskViewModel;

  @override
  String toString() {
    return 'TaskDetailScreenRouteArgs{key: $key, taskViewModel: $taskViewModel}';
  }
}

/// generated route for
/// [_i11.NoteDetailScreen]
class NoteDetailScreenRoute
    extends _i19.PageRouteInfo<NoteDetailScreenRouteArgs> {
  NoteDetailScreenRoute({
    _i20.Key? key,
    required _i26.NoteViewModel noteViewModel,
  }) : super(
          NoteDetailScreenRoute.name,
          path: '/note-detail-screen',
          args: NoteDetailScreenRouteArgs(
            key: key,
            noteViewModel: noteViewModel,
          ),
        );

  static const String name = 'NoteDetailScreenRoute';
}

class NoteDetailScreenRouteArgs {
  const NoteDetailScreenRouteArgs({
    this.key,
    required this.noteViewModel,
  });

  final _i20.Key? key;

  final _i26.NoteViewModel noteViewModel;

  @override
  String toString() {
    return 'NoteDetailScreenRouteArgs{key: $key, noteViewModel: $noteViewModel}';
  }
}

/// generated route for
/// [_i12.CreateNoteScreen]
class CreateNoteScreenRoute
    extends _i19.PageRouteInfo<CreateNoteScreenRouteArgs> {
  CreateNoteScreenRoute({
    _i20.Key? key,
    required _i27.NoteMode noteMode,
    _i28.NoteDetailViewModel? noteDetailViewModel,
  }) : super(
          CreateNoteScreenRoute.name,
          path: '/create-note-screen',
          args: CreateNoteScreenRouteArgs(
            key: key,
            noteMode: noteMode,
            noteDetailViewModel: noteDetailViewModel,
          ),
        );

  static const String name = 'CreateNoteScreenRoute';
}

class CreateNoteScreenRouteArgs {
  const CreateNoteScreenRouteArgs({
    this.key,
    required this.noteMode,
    this.noteDetailViewModel,
  });

  final _i20.Key? key;

  final _i27.NoteMode noteMode;

  final _i28.NoteDetailViewModel? noteDetailViewModel;

  @override
  String toString() {
    return 'CreateNoteScreenRouteArgs{key: $key, noteMode: $noteMode, noteDetailViewModel: $noteDetailViewModel}';
  }
}

/// generated route for
/// [_i13.CreateTaskScreen]
class CreateTaskScreenRoute
    extends _i19.PageRouteInfo<CreateTaskScreenRouteArgs> {
  CreateTaskScreenRoute({
    _i20.Key? key,
    required _i29.TaskMode taskMode,
    _i30.TaskDetailViewModel? taskDetailViewModel,
  }) : super(
          CreateTaskScreenRoute.name,
          path: '/create-task-screen',
          args: CreateTaskScreenRouteArgs(
            key: key,
            taskMode: taskMode,
            taskDetailViewModel: taskDetailViewModel,
          ),
        );

  static const String name = 'CreateTaskScreenRoute';
}

class CreateTaskScreenRouteArgs {
  const CreateTaskScreenRouteArgs({
    this.key,
    required this.taskMode,
    this.taskDetailViewModel,
  });

  final _i20.Key? key;

  final _i29.TaskMode taskMode;

  final _i30.TaskDetailViewModel? taskDetailViewModel;

  @override
  String toString() {
    return 'CreateTaskScreenRouteArgs{key: $key, taskMode: $taskMode, taskDetailViewModel: $taskDetailViewModel}';
  }
}

/// generated route for
/// [_i14.CreateProjectScreen]
class CreateProjectScreenRoute
    extends _i19.PageRouteInfo<CreateProjectScreenRouteArgs> {
  CreateProjectScreenRoute({
    _i20.Key? key,
    required _i31.ProjectMode projectMode,
    _i25.ProjectViewModel? projectViewModel,
  }) : super(
          CreateProjectScreenRoute.name,
          path: '/create-project-screen',
          args: CreateProjectScreenRouteArgs(
            key: key,
            projectMode: projectMode,
            projectViewModel: projectViewModel,
          ),
        );

  static const String name = 'CreateProjectScreenRoute';
}

class CreateProjectScreenRouteArgs {
  const CreateProjectScreenRouteArgs({
    this.key,
    required this.projectMode,
    this.projectViewModel,
  });

  final _i20.Key? key;

  final _i31.ProjectMode projectMode;

  final _i25.ProjectViewModel? projectViewModel;

  @override
  String toString() {
    return 'CreateProjectScreenRouteArgs{key: $key, projectMode: $projectMode, projectViewModel: $projectViewModel}';
  }
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
