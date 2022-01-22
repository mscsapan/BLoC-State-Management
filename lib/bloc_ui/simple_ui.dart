import 'package:bloc_library/bloc_ui/controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleUi extends StatefulWidget {
  const SimpleUi({Key? key}) : super(key: key);

  @override
  State<SimpleUi> createState() => _SimpleUiState();
}

class _SimpleUiState extends State<SimpleUi> {
  int position = 0;

  void getPosition(int index) {
    setState(() {
      position = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ControllerCubit controller =
        BlocProvider.of<ControllerCubit>(context);
    debugPrint('===== Calling=====');
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Ui')),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        itemBuilder: (context, index) {
          return BlocBuilder<ControllerCubit, ControllerState>(
            builder: (context, state) {
              return InkWell(
                onTap: () => getPosition(index),
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    height: 80.0,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Container(
                          height: 34.0,
                          width: 34.0,
                          margin: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 2.0),
                              shape: BoxShape.circle),
                          child: Container(
                            height: 28.0,
                            width: 28.0,
                            margin: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: position == index
                                  ? index % 2 == 0
                                      ? Colors.green
                                      : Colors.blue
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
