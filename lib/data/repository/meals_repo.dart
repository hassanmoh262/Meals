import 'package:dart_either/src/dart_either.dart';
import 'package:meals/core/error/exceptions.dart';
import 'package:meals/core/error/failure.dart';
import 'package:meals/data/datasource/meals_datasource.dart';
import 'package:meals/domain/entities/meal_details.dart';
import 'package:meals/domain/entities/meals.dart';
import 'package:meals/domain/repository/base_meals_repo.dart';

class MealsRepo extends BaseMealsRepo {
  final BaseMealsDatasource baseMealsDatasource;

  MealsRepo(this.baseMealsDatasource);

  @override
  Future<Either<Failure, List<Meals>>> getMeals() async {
    try {
      final result = await baseMealsDatasource.getMeals();
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, MealDetails>> getMealDetails(String mealName) async {
    try {
      final result = await baseMealsDatasource.getMealDetails(mealName);
      return Right(result);
    } on ServerExceptions catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.errorMessage),
      );
    }
  }
}
