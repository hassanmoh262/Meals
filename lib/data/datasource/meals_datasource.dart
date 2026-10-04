import 'package:dio/dio.dart';
import 'package:meals/core/error/exceptions.dart';
import 'package:meals/core/network/error_message_model.dart';
import 'package:meals/data/models/meal_details_model.dart';
import 'package:meals/data/models/meals_model.dart';
import 'package:meals/domain/entities/meal_details.dart';

abstract class BaseMealsDatasource {
  Future<List<MealsModel>> getMeals();
  Future<MealDetailsModel> getMealDetails(String mealName);
}

class MealsDatasource extends BaseMealsDatasource {
  @override
  Future<List<MealsModel>> getMeals() async {
    try {
      final response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/search.php?f=a',
      );
      if (response.statusCode == 200) {
        final List? mealsJson = response.data["meals"];
        if (mealsJson != null) {
          return mealsJson
              .map((e) => MealsModel.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return [];
        }
      } else {
        throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioException catch (e) {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel(
          errorMessage: e.message ?? "حدث خطأ في الاتصال بالشبكة",
        ),
      );
    }
  }

  @override
  Future<MealDetailsModel> getMealDetails(String mealName) async {
    try {
      final response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName',
      );
      if (response.statusCode == 200) {
        final List? mealsJson = response.data["meals"];
        if (mealsJson != null) {
          return MealDetailsModel.fromJson(
            mealsJson.first as Map<String, dynamic>,
          );
        } else {
          throw ServerExceptions(
            errorMessageModel: ErrorMessageModel(errorMessage: 'errorMessage'),
          );
        }
      } else {
        throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioException catch (e) {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel(
          errorMessage: e.message ?? "حدث خطأ في الاتصال بالشبكة",
        ),
      );
    }
  }
}
