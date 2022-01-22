part of 'controller_cubit.dart';

@immutable
abstract class ControllerState {}

class InitialController extends ControllerState {
  final int position;

  InitialController({required this.position});
}
