part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserInputInProgress extends UserState {
  final String name;

  UserInputInProgress(this.name);
}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final String name;

  UserLoadSuccess(this.name);
}
