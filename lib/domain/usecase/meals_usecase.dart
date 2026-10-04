import 'package:dart_either/src/dart_either.dart';
import 'package:meals/core/error/failure.dart';
import 'package:meals/core/usecase/base_usecase.dart';
import 'package:meals/domain/entities/meals.dart';
import 'package:meals/domain/repository/base_meals_repo.dart';

class MealsUsecase extends BaseUsecase<List<Meals>, NoParameter> {
  final BaseMealsRepo baseMealsRepo;

  MealsUsecase({required this.baseMealsRepo});
  @override
  Future<Either<Failure, List<Meals>>> call(NoParameter parameter) async {
    return await baseMealsRepo.getMeals();
  }
}
