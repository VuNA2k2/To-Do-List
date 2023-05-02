part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginEventLogin extends LoginEvent {
  final String username;
  final String password;
  LoginEventLogin(this.username, this.password);
}