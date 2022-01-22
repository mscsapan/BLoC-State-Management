import 'package:bloc_library/user/user_model.dart';
import 'package:bloc_library/user/user_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<List<UserModel>> {
  UserCubit() : super([]);

  void getUserFromCubit() async {
    emit(await UserNetwork().getUser());
  }
}
