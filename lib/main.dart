import 'package:bloc_library/example/bloc/weather_bloc.dart';
import 'package:bloc_library/example/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (_) => ExampleBloc(),
          child: GetTemperature(),
        ),
      ),
    );
