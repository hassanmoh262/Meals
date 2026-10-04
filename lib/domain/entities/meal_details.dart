import 'package:equatable/equatable.dart';

class MealDetails extends Equatable {
  // تحويل المتغيرات المنفصلة إلى قائمة وتجاهل القيم الفارغة
  List<Map<String, String>> get ingredientsList {
    final List<Map<String, String>> list = [
      {'name': ingredients1, 'measure': measure1},
      {'name': ingredients2, 'measure': measure2},
      {'name': ingredients3, 'measure': measure3},
      {'name': ingredients4, 'measure': measure4},
      {'name': ingredients5, 'measure': measure5},
      {'name': ingredients6, 'measure': measure6},
      {'name': ingredients7, 'measure': measure7},
      {'name': ingredients8, 'measure': measure8},
      {'name': ingredients9, 'measure': measure9},
      {'name': ingredients10, 'measure': measure10},
    ];

    // فلترة العناصر بحيث نأخذ فقط المكونات غير الفارغة
    return list
        .where(
          (item) => item['name'] != null && item['name']!.trim().isNotEmpty,
        )
        .toList();
  }

  final String mealName;
  final String instructions;
  final String image;
  final String ingredients1;
  final String ingredients2;
  final String ingredients3;
  final String ingredients4;
  final String ingredients5;
  final String ingredients6;
  final String ingredients7;
  final String ingredients8;
  final String ingredients9;
  final String ingredients10;
  final String measure1;
  final String measure2;
  final String measure3;
  final String measure4;
  final String measure5;
  final String measure6;
  final String measure7;
  final String measure8;
  final String measure9;
  final String measure10;

  MealDetails({
    required this.mealName,
    required this.instructions,
    required this.image,
    required this.ingredients1,
    required this.ingredients2,
    required this.ingredients3,
    required this.ingredients4,
    required this.ingredients5,
    required this.ingredients6,
    required this.ingredients7,
    required this.ingredients8,
    required this.ingredients9,
    required this.ingredients10,
    required this.measure1,
    required this.measure2,
    required this.measure3,
    required this.measure4,
    required this.measure5,
    required this.measure6,
    required this.measure7,
    required this.measure8,
    required this.measure9,
    required this.measure10,
  });

  @override
  List<Object?> get props => [
    mealName,
    instructions,
    image,
    ingredients1,
    ingredients2,
    ingredients3,
    ingredients4,
    ingredients5,
    ingredients6,
    ingredients7,
    ingredients8,
    ingredients9,
    ingredients10,
    measure1,
    measure2,
    measure3,
    measure4,
    measure5,
    measure6,
    measure7,
    measure8,
    measure9,
    measure10,
  ];
}
