import 'package:bloc_library/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('===== Calling=====');
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, CounterState state) {
          return Center(
              child: Text(
            state.count.toString(),
            style: const TextStyle(fontSize: 40.0),
          ));
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
                onPressed: () {
                  counterBloc.add(Decrement());
                },
                child: const Icon(Icons.remove)),
            FloatingActionButton(
                onPressed: () {
                  counterBloc.add(Reset());
                },
                child: const Icon(Icons.refresh)),
            FloatingActionButton(
                onPressed: () {
                  counterBloc.add(Increment());
                },
                child: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
