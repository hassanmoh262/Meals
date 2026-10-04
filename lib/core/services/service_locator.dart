import 'package:get_it/get_it.dart';
import 'package:meals/data/datasource/meals_datasource.dart';
import 'package:meals/data/repository/meals_repo.dart';
import 'package:meals/domain/repository/base_meals_repo.dart';
import 'package:meals/domain/usecase/meals_details_usecase.dart';
import 'package:meals/domain/usecase/meals_usecase.dart';
import 'package:meals/presentation/controller/meals_cubit/meals_cubit.dart';
import 'package:meals/presentation/controller/meals_details_cubit/meals_details_cubit.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //datasource
    sl.registerLazySingleton<BaseMealsDatasource>(() => MealsDatasource());
    //datarepo
    sl.registerLazySingleton<BaseMealsRepo>(
      () => MealsRepo(sl<BaseMealsDatasource>()),
    );
    //usecases
    sl.registerLazySingleton<MealsUsecase>(
      () => MealsUsecase(baseMealsRepo: sl()),
    );
    sl.registerLazySingleton<MealsDetailsUsecase>(
      () => MealsDetailsUsecase(baseMealsRepo: sl()),
    );
    //cubit
    sl.registerFactory<MealsCubit>(() => MealsCubit(sl()));
    sl.registerFactory<MealsDetailsCubit>(
      () => MealsDetailsCubit(mealsDetailsUsecase: sl()),
    );
  }
}
