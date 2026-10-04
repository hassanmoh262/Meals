import 'package:dart_either/src/dart_either.dart';
import 'package:equatable/equatable.dart';
import 'package:meals/core/error/failure.dart';
import 'package:meals/core/usecase/base_usecase.dart';
import 'package:meals/domain/entities/meal_details.dart';
import 'package:meals/domain/repository/base_meals_repo.dart';

class MealsDetailsUsecase extends BaseUsecase<MealDetails, MealsParamter> {
  final BaseMealsRepo baseMealsRepo;

  MealsDetailsUsecase({required this.baseMealsRepo});
  @override
  Future<Either<Failure, MealDetails>> call(MealsParamter paramter) async {
    return await baseMealsRepo.getMealDetails(paramter.mealName);
  }
}

class MealsParamter extends Equatable {
  final String mealName;

  MealsParamter({required this.mealName});

  @override
  // TODO: implement props
  List<Object?> get props => [mealName];
}
