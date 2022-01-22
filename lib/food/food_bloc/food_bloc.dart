import 'package:bloc/bloc.dart';
import 'package:bloc_library/food/food_services/food_services.dart';
import 'package:bloc_library/food/model/food_model.dart';
import 'package:equatable/equatable.dart';

part 'food_event.dart';

part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(InitialFoodState()) {
    on<FoodEvent>((event, emit) async {
      if (event is FetchFoodEvent) {
        emit(LoadingFoodState());
        try {
          List<Recipe> recipe = await FoodNetwork().getNetworkFood();
          emit(LoadedFoodState(recipe));
        } catch (e) {
          emit(HasErrorFoodState(e.toString()));
        }
      }
    });
  }
}
