import 'package:bloc_library/example/bloc/weather_bloc.dart';
import 'package:bloc_library/example/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weather_bloc.dart';
import '../example/bloc/weather_event.dart';
import '../example/bloc/weather_state.dart';

class GetTemperature extends StatelessWidget {
  GetTemperature({Key? key}) : super(key: key);
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ExampleBloc getWeather = BlocProvider.of<ExampleBloc>(context);
    return Scaffold(
      appBar: AppBar(title: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (context, state) {
          if (state is ExampleStateInitial) {
            return const Text('Get Temperature');
          } else if (state is ExampleStateLoading) {
            return const Text('Getting Temperature...');
          }
          return const Text('Get Temperature');
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ExampleBloc, ExampleState>(builder: (context, state) {
              if (state is ExampleStateInitial) {
                return simpleText();
              } else if (state is ExampleStateLoading) {
                return loading();
              } else if (state is ExampleStateLoaded) {
                return getExampleData(state.example);
              } else if (state is ExampleStateHasError) {
                return Text(state.message);
              }
              return const Text('Have No Data');
            }),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: cityController,
                autofocus: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'City Name'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  getWeather
                      .add(InsertExampleEvent(cityName: cityController.text));
                  cityController.clear();
                },
                child: const Icon(Icons.refresh))
          ],
        ),
      ),
    );
  }

  Widget getExampleData(Example example) {
    return Column(
      children: [
        Text(
          example.cityName,
          style: const TextStyle(fontSize: 30.0),
        ),
        const SizedBox(height: 20.0),
        Text(
          '${example.temperature.toStringAsFixed(1)} °C',
          style: const TextStyle(fontSize: 40.0),
        ),
      ],
    );
  }

  Widget simpleText() {
    return const Text(
      '0.0 °C',
      style: TextStyle(fontSize: 40.0),
    );
  }

  Widget loading() {
    return const CircularProgressIndicator();
  }
}
