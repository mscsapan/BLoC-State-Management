part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class FetchFoodEvent extends FoodEvent {
  @override
  List<Object?> get props => [];
}
