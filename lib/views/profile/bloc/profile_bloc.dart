import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/exception.dart';
import 'package:todo_list/views/fill_profile/view_model/user_info_mapper.dart';
import 'package:todo_list/views/fill_profile/view_model/user_info_view_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final GetUserDetailUseCase _getUserDetailUseCase = ConfigDI().injector.get();
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialEvent>(_initData);
  }

  FutureOr<void> _initData(ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    try {
      final res = await _getUserDetailUseCase.call();
      if(res != null) {
        emit(ProfileStableState(userInfoViewModel: UserInfoMapper.getUserInfoViewModelFromUserEntity(res)));
      } else {
        emit(ProfileErrorState(L.current.errorDefaultMessage));
        }
    } catch (e) {
      final message = handleException(e);
      emit(ProfileErrorState(message));
    }
  }
}
