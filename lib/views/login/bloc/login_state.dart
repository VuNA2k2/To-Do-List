part of 'login_bloc.dart';

@immutable
abstract class LoginState {
}

class LoginInitial extends LoginState {
}
class LoginLoading extends LoginState {
}
class LoginSuccess extends LoginState {
}
class LoginFailure extends LoginState {
  String error;
  LoginFailure({this.error = "Login failed!"});
}
