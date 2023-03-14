import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/route/route.gr.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial(duration: const Duration(seconds: 10))) {
    on<SplashInitEvent>(_init);
    on<SplashTickEvent>(_tick);
    on<SplashNavigateEvent>(_navigate);
  }

  Timer? timer;


  FutureOr<void> _init(SplashInitEvent event, Emitter<SplashState> emit) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(SplashTickEvent());
    });
  }

  FutureOr<void> _tick(SplashTickEvent event, Emitter<SplashState> emit) {
    if(state is SplashInitial) {
      emit(SplashLoadingState(duration: Duration(seconds: (state as SplashInitial).duration.inSeconds - 1)));
    } if(state is SplashLoadingState) {
      if((state as SplashLoadingState).duration.inSeconds == 0) {
        //  TODO: navigate route default navigate login
        add(SplashNavigateEvent(LoginScreenRoute.name));
      } else {
        emit(SplashLoadingState(duration: Duration(seconds: (state as SplashLoadingState).duration.inSeconds - 1)));
      }
    }
  }



  FutureOr<void> _navigate(SplashNavigateEvent event, Emitter<SplashState> emit) {
    if(event.route == HomeScreenRoute.name) {
      emit(SplashHomeState());
    } else {
      emit(SplashLoginState());
    }
  }
}
