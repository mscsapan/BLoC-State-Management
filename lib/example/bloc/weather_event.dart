import 'package:equatable/equatable.dart';

abstract class ExampleEvent extends Equatable {
  const ExampleEvent();

  @override
  List<Object?> get props => [];
}

class InsertExampleEvent extends ExampleEvent {
  final String cityName;

  const InsertExampleEvent({required this.cityName});

  @override
  List<Object?> get props => [];
}
