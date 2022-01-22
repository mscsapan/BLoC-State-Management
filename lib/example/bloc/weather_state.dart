import 'package:equatable/equatable.dart';

import '../weather_model.dart';

abstract class ExampleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExampleStateInitial extends ExampleState {
  final double temperature;

  ExampleStateInitial({required this.temperature});

  @override
  List<Object?> get props => [temperature];
}

class ExampleStateLoading extends ExampleState {
  @override
  List<Object?> get props => [];
}

class ExampleStateLoaded extends ExampleState {
  final Example example;

  ExampleStateLoaded({required this.example});

  @override
  List<Object?> get props => [example];
}

class ExampleStateHasError extends ExampleState {
  final String message;

  ExampleStateHasError({required this.message});

  @override
  List<Object?> get props => [message];
}
