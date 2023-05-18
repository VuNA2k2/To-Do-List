import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginUseCase _loginUseCase = ConfigDI().injector.get();

  LoginBloc() : super(LoginInitial()) {
    on<LoginEventLogin>(_login);
  }

  FutureOr<void> _login(LoginEventLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
          await _loginUseCase.call(LoginEntity(event.username, event.password));
        emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
