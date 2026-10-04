import 'package:meals/domain/entities/meals.dart';

class MealsModel extends Meals {
  MealsModel({required super.image, required super.mealName});

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(image: json["strMealThumb"], mealName: json["strMeal"]);
  }
}
