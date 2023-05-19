part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpStableState extends SignUpState {
  final AccountViewModel accountViewModel;

  SignUpStableState({
    required this.accountViewModel,
  });
}

class SignUpInvalidState extends SignUpStableState {
  String? message;
  SignUpInvalidState({required super.accountViewModel, this.message});
}

class SignUpValidState extends SignUpStableState {
  SignUpValidState({required super.accountViewModel});
}


