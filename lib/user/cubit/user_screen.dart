import 'package:bloc_library/user/cubit/user_cubit.dart';
import 'package:bloc_library/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  Widget getUserList() {
    return BlocBuilder<UserCubit, List<UserModel>>(
      builder: (context, state) {
        return state.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        CircleAvatar(child: Text(state[index].id.toString())),
                    title: Text(state[index].name.toString()),
                    subtitle: Text(state[index].email.toString()),
                  );
                },
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Users'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: getUserList(),
    );
  }
}
