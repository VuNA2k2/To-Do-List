part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {
  late Duration duration;
  SplashInitial({required this.duration});
}

class SplashLoadingState extends SplashState {
  late Duration duration;
  SplashLoadingState({required this.duration});
}

class SplashLoginState extends SplashState {}

class SplashHomeState extends SplashState {}
