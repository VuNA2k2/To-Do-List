part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpEventInit extends SignUpEvent {}

class SignUpEventSubmit extends SignUpEvent {
}

class SignUpEventCheckValidate extends SignUpEvent {
}
