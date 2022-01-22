part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class InitialFoodState extends FoodState {
  @override
  List<Object?> get props => [];
}

class LoadingFoodState extends FoodState {
  @override
  List<Object?> get props => [];
}

class LoadedFoodState extends FoodState {
  final List<Recipe>? recipe;

  const LoadedFoodState(this.recipe);

  @override
  List<Object?> get props => [];
}

class HasErrorFoodState extends FoodState {
  final String errorMessage;

  const HasErrorFoodState(this.errorMessage);

  @override
  List<Object?> get props => [];
}
