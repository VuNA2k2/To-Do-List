import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/utils/exception.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitEvent>(_initData);
  }

final GetUserDetailUseCase _getUserDetailUseCase = ConfigDI().injector.get();
  FutureOr<void> _initData(HomeInitEvent event, Emitter<HomeState> emit) async {
    try {
      final res = await _getUserDetailUseCase.call();
      if(res != null) {
        emit(HomeStableState(username: res.username));
      }
    } catch (e) {
      final message = handleException(e);
      emit(HomeErrorState(message: message));
    }
  }
}
