part of 'fill_profile_bloc.dart';

@immutable
abstract class FillProfileEvent {}

class FillProfileInitialEvent extends FillProfileEvent {
  final AccountViewModel accountViewModel;
  final ProfileMode profileMode;
  final UserInfoViewModel? userInfoViewModel;

  FillProfileInitialEvent(
      {required this.accountViewModel,
      required this.profileMode,
      this.userInfoViewModel});
}

class FillProfileChangeDateOfBirth extends FillProfileEvent {
  final DateTime dateOfBirth;

  FillProfileChangeDateOfBirth({required this.dateOfBirth});
}

class FillProfileChangeAvatarEvent extends FillProfileEvent {
  final String avatar;

  FillProfileChangeAvatarEvent({required this.avatar});
}

class FillProfileValidateEvent extends FillProfileEvent {
  FillProfileValidateEvent();
}

class FillProfileSubmitEvent extends FillProfileEvent {
  FillProfileSubmitEvent();
}
