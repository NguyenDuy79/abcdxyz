import 'package:fitness_and_nutrition/presentation/bloc/nutri_cubit/nutri_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../data/repository/infomation_repository_impl.dart';
import '../../data/repository/meal_repository_impl.dart';
import '../../data/repository/water_repository_impl.dart';
import '../../data/source/local/database/database_manager.dart';
import '../../data/source/local/pref/pref_local.dart';
import '../../domain/repository/infomation_repository.dart';
import '../../domain/repository/meal_repository.dart';
import '../../domain/repository/water_repository.dart';
import '../../domain/usecase/meal/get_all_meal_usecase.dart';
import '../../domain/usecase/meal/insert_meal_usecase.dart';
import '../../domain/usecase/set_up/get_all_data_usecase.dart';
import '../../domain/usecase/set_up/insert_data_usecase.dart';
import '../../domain/usecase/water/get_all_water_usecase.dart';
import '../../domain/usecase/water/insert_water_usecase.dart';
import '../../domain/usecase/water/update_water_usecase.dart';
import '../../presentation/bloc/infotion_cubit/infomation_cubit.dart';
import '../../presentation/bloc/water_cubit/water_cubit.dart';
import '../../presentation/view/into/bloc/cubit/infomation_body_dart_cubit.dart';
import '../../presentation/view/meal/bloc/meal/meal_cubit.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  await DatabaseManager.instance.openDatabase();
  await PrefLocal().setPreferences();

  // Repository
  injector.registerLazySingleton<InfomationRepository>(
      () => InfomationRepositoryImpl());
  injector.registerLazySingleton<MealRepository>(() => MealRepositoryImpl());
  injector.registerLazySingleton<WaterRepository>(() => WaterRepositoryImpl());
  // Usecase

  // Usecase infomation
  injector.registerLazySingleton<InsretDataUseCase>(
      () => InsretDataUseCase(injector()));
  injector.registerLazySingleton<GetAllDataUseCase>(
    () => GetAllDataUseCase(injector()),
  );

  // usecase meal
  injector.registerLazySingleton<InsretMealUseCase>(
      () => InsretMealUseCase(injector()));
  injector.registerLazySingleton<GetAllMealUseCase>(
      () => GetAllMealUseCase(injector()));

  // usecase water
  injector.registerLazySingleton<InsertWaterUseCase>(
      () => InsertWaterUseCase(injector()));
  injector.registerLazySingleton<GetAllWaterUseCase>(
      () => GetAllWaterUseCase(injector()));
  injector.registerLazySingleton<UpdateWaterUseCase>(
      () => UpdateWaterUseCase(injector()));
  // Cubit

  // InfomationCubit
  injector.registerFactory<InfomationBodyDartCubit>(
      () => InfomationBodyDartCubit(insretDataUseCase: injector()));
  injector.registerFactory<MealCubit>(
      () => MealCubit(insretMealUseCase: injector()));
  // Common bloc
  injector.registerLazySingleton<InfomationCubit>(() => InfomationCubit(
      getAllDataUseCase: injector(), insretDataUseCase: injector()));
  injector.registerLazySingleton<NutriCubit>(() =>
      NutriCubit(getAllMealUseCase: injector(), insretMealUseCase: injector()));
  injector.registerLazySingleton<WaterCubit>(() => WaterCubit(
      getAllWaterUseCase: injector(),
      insertWaterUseCase: injector(),
      updateWaterUseCase: injector()));
}
