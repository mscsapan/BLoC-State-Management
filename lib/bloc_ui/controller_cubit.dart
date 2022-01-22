import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'controller_state.dart';

class ControllerCubit extends Cubit<ControllerState> {
  ControllerCubit() : super(InitialController(position: 0));

  void positionChangedController(int index) =>
      emit(InitialController(position: index));
}
