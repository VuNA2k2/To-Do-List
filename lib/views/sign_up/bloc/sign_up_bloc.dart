import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/views/sign_up/view_model/account_view_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEventInit>(_initData);
    on<SignUpEventSubmit>(_submitData);
  }

  FutureOr<void> _initData(SignUpEventInit event, Emitter<SignUpState> emit) {
    emit(SignUpStableState(
      accountViewModel: AccountViewModel(
        username: usernameController.text,
        password: passwordController.text,
      ),
    ));
  }

  FutureOr<void> _submitData(SignUpEventSubmit event, Emitter<SignUpState> emit) {
    _checkValidate(event, emit);
    if(state is SignUpStableState && state is! SignUpInvalidState) {
      emit(SignUpValidState(
        accountViewModel: AccountViewModel(
          username: usernameController.text,
          password: passwordController.text,
        ),
      ));
    }
  }

  FutureOr<void> _checkValidate(event, Emitter<SignUpState> emit) {
    if(usernameController.text.isEmpty) {
      emit(SignUpInvalidState(
        accountViewModel: AccountViewModel(
          username: usernameController.text,
          password: passwordController.text,
        ),
        message: L.current.signUpScreenUsernameEmpty,
      ));
    }
    else if(passwordController.text.isEmpty) {
      emit(SignUpInvalidState(
        accountViewModel: AccountViewModel(
          username: usernameController.text,
          password: passwordController.text,
        ),
        message: L.current.signUpScreenPasswordEmpty,
      ));
    }
    else if(passwordController.text != confirmPasswordController.text) {
      emit(SignUpInvalidState(
        accountViewModel: AccountViewModel(
          username: usernameController.text,
          password: passwordController.text,
        ),
        message: L.current.signUpScreenPasswordNotMatch,
      ));
    }
    else {
      emit(SignUpStableState(
        accountViewModel: AccountViewModel(
          username: usernameController.text,
          password: passwordController.text,
        ),
      ));
    }

  }
}
