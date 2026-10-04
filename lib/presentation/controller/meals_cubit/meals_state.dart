part of 'meals_cubit.dart';

sealed class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

final class MealsInitial extends MealsState {}

final class MealsLoadingState extends MealsState {}

final class MealsLoadedState extends MealsState {
  final List<Meals> meals;

  MealsLoadedState(this.meals);
  @override
  List<Object> get props => [meals];
}

final class MealsErrorState extends MealsState {
  final String errorMessage;

  MealsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
