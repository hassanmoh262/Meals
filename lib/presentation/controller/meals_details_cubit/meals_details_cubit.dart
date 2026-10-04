import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals/domain/entities/meal_details.dart';
import 'package:meals/domain/usecase/meals_details_usecase.dart';

part 'meals_details_state.dart';

class MealsDetailsCubit extends Cubit<MealsDetailsState> {
  final MealsDetailsUsecase mealsDetailsUsecase;
  MealsDetailsCubit({required this.mealsDetailsUsecase})
    : super(MealsDetailsInitialState());
  void getMealDetails(String mealName) async {
    emit(MealsDetailsInitialState());

    final result = await mealsDetailsUsecase.call(
      MealsParamter(mealName: mealName),
    );

    result.fold(
      ifLeft: (failure) {
        emit(MealsDetailsErrorState(failure.message));
      },
      ifRight: (mealsDetails) {
        emit(MealsDetailsLoadedState(mealsDetails));
      },
    );
  }
}
