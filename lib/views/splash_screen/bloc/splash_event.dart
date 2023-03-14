part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class SplashInitEvent extends SplashEvent {

}

class SplashTickEvent extends SplashEvent {

}

class SplashNavigateEvent extends SplashEvent {
  String route;
  SplashNavigateEvent(this.route);
}
