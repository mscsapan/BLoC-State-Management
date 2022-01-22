import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import '../weather_model.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial(temperature: 0.0)) {
    on<ExampleEvent>((ExampleEvent event, Emitter emit) async {
      if (event is InsertExampleEvent) {
        emit(ExampleStateLoading());
        try {
          final Example example = await _getWeatherExample(event.cityName);
          emit(ExampleStateLoaded(example: example));
        } catch (e) {
          emit(ExampleStateHasError(message: e.toString()));
        }
      }
    });
  }
}

Future<Example> _getWeatherExample(String city) async {
  return Future.delayed(const Duration(seconds: 1), () {
    return Example(
      temperature: 20 + Random().nextInt(25) + Random().nextDouble(),
      cityName: city,
    );
  });
}
