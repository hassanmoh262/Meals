import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals/core/usecase/base_usecase.dart';
import 'package:meals/domain/entities/meals.dart';
import 'package:meals/domain/usecase/meals_usecase.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  final MealsUsecase mealsUsecase;
  MealsCubit(this.mealsUsecase) : super(MealsInitial());
  List<Meals> allMeals = [];
  void getMeals() async {
    emit(MealsLoadingState());
    final result = await mealsUsecase.call(NoParameter());

    result.fold(
      ifLeft: (failure) {
        emit(MealsErrorState(failure.message));
      },
      ifRight: (meals) {
        allMeals = meals;
        emit(MealsLoadedState(meals));
      },
    );
  }

  void serchMeals(String query) {
    if (query.isEmpty) {
      emit(MealsLoadedState(allMeals));
    } else {
      final filteredMeals = allMeals.where((meal) {
        return meal.mealName.toLowerCase().contains(query.toLowerCase());
      }).toList();

      emit(MealsLoadedState(filteredMeals));
    }
  }
}
