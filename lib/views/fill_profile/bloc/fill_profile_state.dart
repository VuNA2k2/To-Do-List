part of 'fill_profile_bloc.dart';

@immutable
abstract class FillProfileState {}

class FillProfileInitial extends FillProfileState {}

class FillProfileStableState extends FillProfileState {
  final AccountViewModel accountViewModel;
  final UserInfoViewModel userInfoViewModel;
  FillProfileStableState({required this.accountViewModel, required this.userInfoViewModel});
}

class FillProfileValidState extends FillProfileStableState {
  FillProfileValidState({required super.accountViewModel, required super.userInfoViewModel});
}

class FillProfileInvalidState extends FillProfileStableState {
  String? message;
  FillProfileInvalidState({required super.accountViewModel, required super.userInfoViewModel, this.message});
}

class FillProfileLoadingState extends FillProfileState {
}

class FillProfileErrorState extends FillProfileState {
  String? message;
  FillProfileErrorState({this.message});
}

class FillProfileSuccessState extends FillProfileState {
}