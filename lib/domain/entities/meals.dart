import 'package:equatable/equatable.dart';

class Meals extends Equatable {
  final String image;
  final String mealName;

  Meals({required this.image, required this.mealName});

  @override
  // TODO: implement props
  List<Object?> get props => [image, mealName];
}
