import 'package:bloc_library/user/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserModel> users;

  UserLoadedState(this.users);
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState(this.message);
}
