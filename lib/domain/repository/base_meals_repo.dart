import 'package:dart_either/dart_either.dart';
import 'package:meals/core/error/failure.dart';
import 'package:meals/domain/entities/meal_details.dart';
import 'package:meals/domain/entities/meals.dart';

abstract class BaseMealsRepo {
  Future<Either<Failure, List<Meals>>> getMeals();
  Future<Either<Failure, MealDetails>> getMealDetails(String mealName);
}
