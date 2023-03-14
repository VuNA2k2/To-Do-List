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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../views/dashboard/dashboard_screen.dart' as _i5;
import '../views/home/home_screen.dart' as _i2;
import '../views/login/login_screen.dart' as _i3;
import '../views/project/project_screen.dart' as _i6;
import '../views/sign_up/sign_up_screen.dart' as _i4;
import '../views/splash_screen/splash_screen.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(
          key: args.key,
          message: args.message,
        ),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpScreen(),
      );
    },
    DashboardScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DashboardScreen(),
      );
    },
    ProjectScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProjectScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
          children: [
            _i7.RouteConfig(
              DashboardScreenRoute.name,
              path: '',
              parent: HomeScreenRoute.name,
            ),
            _i7.RouteConfig(
              ProjectScreenRoute.name,
              path: 'project-screen',
              parent: HomeScreenRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i7.RouteConfig(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i8.Key? key,
    required String message,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          path: '/home-screen',
          args: HomeScreenRouteArgs(
            key: key,
            message: message,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    this.key,
    required this.message,
  });

  final _i8.Key? key;

  final String message;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i7.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/sign-up-screen',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i5.DashboardScreen]
class DashboardScreenRoute extends _i7.PageRouteInfo<void> {
  const DashboardScreenRoute()
      : super(
          DashboardScreenRoute.name,
          path: '',
        );

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i6.ProjectScreen]
class ProjectScreenRoute extends _i7.PageRouteInfo<void> {
  const ProjectScreenRoute()
      : super(
          ProjectScreenRoute.name,
          path: 'project-screen',
        );

  static const String name = 'ProjectScreenRoute';
}
