import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'do_task_event.dart';
part 'do_task_state.dart';

class DoTaskBloc extends Bloc<DoTaskEvent, DoTaskState> {
  DoTaskBloc() : super(DoTaskInitial()) {
    on<DoTaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
