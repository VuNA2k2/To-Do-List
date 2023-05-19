import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/di/config_di.dart';
import 'package:todo_list/languages/language.dart';
import 'package:todo_list/utils/exception.dart';
import 'package:todo_list/utils/format_utils.dart';
import 'package:todo_list/views/fill_profile/view_model/profile_mode.dart';
import 'package:todo_list/views/fill_profile/view_model/user_info_view_model.dart';
import 'package:todo_list/views/sign_up/view_model/account_view_model.dart';
import 'package:todo_list/views/sign_up/view_model/sign_up_mapper.dart';

part 'fill_profile_event.dart';

part 'fill_profile_state.dart';

class FillProfileBloc extends Bloc<FillProfileEvent, FillProfileState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController avatarController = TextEditingController();

  FillProfileBloc() : super(FillProfileInitial()) {
    on<FillProfileInitialEvent>(_initData);
    on<FillProfileValidateEvent>(_validateData);
    on<FillProfileChangeDateOfBirth>(_changeDateOfBirth);
    on<FillProfileChangeAvatarEvent>(_changeAvatar);
    on<FillProfileSubmitEvent>(_submitData);
  }

  final RegisterUseCase _registerUseCase = ConfigDI().injector.get();
  final UpdateProfileUseCase _updateProfileUseCase = ConfigDI().injector.get();
  late final ProfileMode _profileMode;

  FutureOr<void> _initData(
      FillProfileInitialEvent event, Emitter<FillProfileState> emit) {
    _profileMode = event.profileMode;
    if (event.profileMode == ProfileMode.create) {
      usernameController.text = event.accountViewModel.username;
      dateOfBirthController.text =
          FormatUtils.dateFormat.format(DateTime.now());
      emit(FillProfileStableState(
          accountViewModel: event.accountViewModel,
          userInfoViewModel: UserInfoViewModel(
            username: event.accountViewModel.username,
            name: fullNameController.text,
            dateOfBirth:
                FormatUtils.dateFormat.parse(dateOfBirthController.text),
            email: emailController.text,
            phoneNumber: phoneController.text,
            avatar: null,
          )));
    } else {
      usernameController.text = event.userInfoViewModel!.username;
      fullNameController.text = event.userInfoViewModel!.name;
      dateOfBirthController.text =
          FormatUtils.dateFormat.format(event.userInfoViewModel!.dateOfBirth!);
      emailController.text = event.userInfoViewModel!.email;
      phoneController.text = event.userInfoViewModel!.phoneNumber ?? '';
      avatarController.text = event.userInfoViewModel!.avatar ?? '';
      emit(FillProfileStableState(
          accountViewModel: event.accountViewModel,
          userInfoViewModel: event.userInfoViewModel!));
    }
  }

  FutureOr<void> _validateData(
      FillProfileValidateEvent event, Emitter<FillProfileState> emit) {
    if (state is FillProfileStableState) {
      emit(FillProfileStableState(
          accountViewModel: (state as FillProfileStableState).accountViewModel
            ..username = usernameController.text,
          userInfoViewModel: UserInfoViewModel(
            username: usernameController.text,
            name: fullNameController.text,
            dateOfBirth:
                FormatUtils.dateFormat.parse(dateOfBirthController.text),
            email: emailController.text,
            phoneNumber: phoneController.text,
            avatar: avatarController.text,
          )));
      if (fullNameController.text.isEmpty) {
        emit(
          FillProfileInvalidState(
              accountViewModel:
                  (state as FillProfileStableState).accountViewModel,
              userInfoViewModel:
                  (state as FillProfileStableState).userInfoViewModel,
              message: L.current.fillProfileInvalidName),
        );
      } else if (emailController.text.isEmpty) {
        emit(
          FillProfileInvalidState(
              accountViewModel:
                  (state as FillProfileStableState).accountViewModel,
              userInfoViewModel:
                  (state as FillProfileStableState).userInfoViewModel,
              message: L.current.fillProfileInvalidEmail),
        );
      } else {
        if (emailController.text.isNotEmpty) {
          if (!_validateEmail(emailController.text)) {
            emit(
              FillProfileInvalidState(
                  accountViewModel:
                      (state as FillProfileStableState).accountViewModel,
                  userInfoViewModel:
                      (state as FillProfileStableState).userInfoViewModel,
                  message: L.current.fillProfileInvalidEmail),
            );
          }
        } else if (phoneController.text.isNotEmpty) {
          if (!_validatePhoneNumber(phoneController.text)) {
            emit(
              FillProfileInvalidState(
                  accountViewModel:
                      (state as FillProfileStableState).accountViewModel,
                  userInfoViewModel:
                      (state as FillProfileStableState).userInfoViewModel,
                  message: L.current.fillProfileInvalidPhone),
            );
          }
        }
        emit(
          FillProfileValidState(
            accountViewModel:
                (state as FillProfileStableState).accountViewModel,
            userInfoViewModel:
                (state as FillProfileStableState).userInfoViewModel,
          ),
        );
      }
    }
  }

  bool _validatePhoneNumber(String phoneNumber) {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phoneNumber);
  }

  bool _validateEmail(String email) {
    return RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)')
        .hasMatch(email);
  }

  FutureOr<void> _changeDateOfBirth(
      FillProfileChangeDateOfBirth event, Emitter<FillProfileState> emit) {
    dateOfBirthController.text =
        FormatUtils.dateFormat.format(event.dateOfBirth);
    emit(FillProfileStableState(
        accountViewModel: (state as FillProfileStableState).accountViewModel,
        userInfoViewModel: UserInfoViewModel(
          username: usernameController.text,
          name: fullNameController.text,
          dateOfBirth: FormatUtils.dateFormat.parse(dateOfBirthController.text),
          email: emailController.text,
          phoneNumber: phoneController.text,
          avatar: null,
        )));
  }

  FutureOr<void> _changeAvatar(
      FillProfileChangeAvatarEvent event, Emitter<FillProfileState> emit) {
    avatarController.text = event.avatar;
    emit(
      FillProfileStableState(
        accountViewModel: (state as FillProfileStableState).accountViewModel,
        userInfoViewModel: UserInfoViewModel(
          username: usernameController.text,
          name: fullNameController.text,
          dateOfBirth: FormatUtils.dateFormat.parse(dateOfBirthController.text),
          email: emailController.text,
          phoneNumber: phoneController.text,
          avatar: event.avatar,
        ),
      ),
    );
  }

  FutureOr<void> _submitData(
      FillProfileSubmitEvent event, Emitter<FillProfileState> emit) async {
    if (state is FillProfileValidState) {
      FillProfileValidState validState = state as FillProfileValidState;
      emit(FillProfileLoadingState());
      try {
        if (_profileMode == ProfileMode.create) {
          await _registerUseCase.call(
              userEntity: SignUpMapper
                  .getUserEntityFromAccountViewModelAndUserInfoViewModel(
                      accountViewModel: validState.accountViewModel,
                      userInfoViewModel: validState.userInfoViewModel));
        } else {
          await _updateProfileUseCase.call(
              SignUpMapper.getUserEntityFromUserInfoViewModel(
                  validState.userInfoViewModel));
        }
        emit(FillProfileSuccessState());
      } catch (e) {
        final message = handleException(e);
        emit(FillProfileErrorState(message: message));
      }
    }
  }
}
