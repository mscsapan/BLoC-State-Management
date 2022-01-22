import 'package:bloc_library/food/food_bloc/food_bloc.dart';
import 'package:bloc_library/food/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    FoodBloc foodBloc = BlocProvider.of<FoodBloc>(context);
    foodBloc.add(FetchFoodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('==== SetState ====');
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Library')),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is InitialFoodState) {
            return initialState();
          } else if (state is LoadingFoodState) {
            return loadingIndicator();
          } else if (state is LoadedFoodState) {
            return loadedFoodView(state.recipe!);
          } else if (state is HasErrorFoodState) {
            return errorView();
          }
          return const Text('');
        },
      ),
    );
  }
}

Widget loadingIndicator() {
  return const Center(child: CircularProgressIndicator());
}

Widget loadedFoodView(List<Recipe> recipe) {
  return ListView.builder(
      itemCount: recipe.length,
      itemBuilder: (_, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(recipe[index].imageUrl.toString()),
          ),
          title: Text(recipe[index].title.toString()),
          subtitle: Text(recipe[index].publisher.toString()),
        );
      });
}

Widget errorView() {
  return const Center(child: Text('Error has Occurred'));
}

Widget initialState() {
  return const Center(child: Text('Loading Initial State'));
}
