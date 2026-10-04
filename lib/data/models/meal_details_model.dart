import 'package:meals/domain/entities/meal_details.dart';

class MealDetailsModel extends MealDetails {
  MealDetailsModel({
    required super.mealName,
    required super.instructions,
    required super.image,
    required super.ingredients1,
    required super.ingredients2,
    required super.ingredients3,
    required super.ingredients4,
    required super.ingredients5,
    required super.ingredients6,
    required super.ingredients7,
    required super.ingredients8,
    required super.ingredients9,
    required super.ingredients10,
    required super.measure1,
    required super.measure2,
    required super.measure3,
    required super.measure4,
    required super.measure5,
    required super.measure6,
    required super.measure7,
    required super.measure8,
    required super.measure9,
    required super.measure10,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {
    return MealDetailsModel(
      mealName: json["strMeal"],
      instructions: json["strInstructions"],
      image: json["strMealThumb"],
      ingredients1: json["strIngredient1"],
      ingredients2: json["strIngredient2"],
      ingredients3: json["strIngredient3"],
      ingredients4: json["strIngredient4"],
      ingredients5: json["strIngredient5"],
      ingredients6: json["strIngredient6"],
      ingredients7: json["strIngredient7"],
      ingredients8: json["strIngredient8"],
      ingredients9: json["strIngredient9"],
      ingredients10: json["strIngredient10"],
      measure1: json["strMeasure1"],
      measure2: json["strMeasure2"],
      measure3: json["strMeasure3"],
      measure4: json["strMeasure4"],
      measure5: json["strMeasure5"],
      measure6: json["strMeasure6"],
      measure7: json["strMeasure7"],
      measure8: json["strMeasure8"],
      measure9: json["strMeasure9"],
      measure10: json["strMeasure10"],
    );
  }
}
