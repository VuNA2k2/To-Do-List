part of 'fill_profile_bloc.dart';

@immutable
abstract class FillProfileEvent {

}

class FillProfileInitialEvent extends FillProfileEvent {
  final AccountViewModel accountViewModel;
  FillProfileInitialEvent({required this.accountViewModel});
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