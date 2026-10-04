part of 'meals_details_cubit.dart';

sealed class MealsDetailsState extends Equatable {
  const MealsDetailsState();

  @override
  List<Object> get props => [];
}

final class MealsDetailsInitialState extends MealsDetailsState {}

final class MealsDetailsLoadingState extends MealsDetailsState {}

final class MealsDetailsLoadedState extends MealsDetailsState {
  final MealDetails mealDetails;

  MealsDetailsLoadedState(this.mealDetails);
  List<Object> get props => [mealDetails];
}

final class MealsDetailsErrorState extends MealsDetailsState {
  final String errorMessage;

  MealsDetailsErrorState(this.errorMessage);
  List<Object> get props => [errorMessage];
}
