import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterAction { increment, decrement, reset }

class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterState {
  final int count;

  CounterState({required this.count});
}

class Increment extends CounterEvent {}

class Reset extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<CounterEvent>((event, emit) {
      if (event is Increment) {
        emit(CounterState(count: state.count + 1));
      } else if (event is Decrement) {
        if (state.count > 1) {
          emit(CounterState(count: state.count - 1));
        }
      } else if (event is Reset) {
        emit(CounterState(count: state.count * 0));
      }
    });
  }
}
