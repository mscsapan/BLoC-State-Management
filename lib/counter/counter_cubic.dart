import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(60);

  void increment() => emit(state + 1);

  void decrement() {
    emit(state - 1);
  }

  void reset() => emit(state * 0);
}

class CounterCubitScreen extends StatefulWidget {
  const CounterCubitScreen({Key? key}) : super(key: key);

  @override
  State<CounterCubitScreen> createState() => _CounterCubitScreenState();
}

class _CounterCubitScreenState extends State<CounterCubitScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4));
    CounterCubit().decrement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('===== Calling=====');
    final CounterCubit counterCubic = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, int state) {
          return Center(
              child: Text(
            state.toString(),
            style: const TextStyle(fontSize: 60.0),
          ));
        },
      ),
    );
  }
}
