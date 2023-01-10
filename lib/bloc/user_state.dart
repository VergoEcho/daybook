part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final String name = 'Jane';
  late final String email;
}
