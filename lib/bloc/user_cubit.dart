import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void login(String name)  {
    emit(UserLoadInProgress());
    Future.delayed(const Duration(seconds: 1));
    emit(UserLoadSuccess(name));
  }

  void saveName(String name)  {
    emit(UserInputInProgress(name));
  }
}
