part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeStableState extends HomeState {
  String username;
  HomeStableState({required this.username});
}

class HomeErrorState extends HomeState {
  String? message;
  HomeErrorState({this.message});
}