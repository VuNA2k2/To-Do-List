part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileStableState extends ProfileState {
  UserInfoViewModel userInfoViewModel;
  ProfileStableState({required this.userInfoViewModel});
}

class ProfileErrorState extends ProfileState {
  String message;
  ProfileErrorState(this.message);
}
