import 'package:fitness_and_nutrition/data/source/local/database/database_manager.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/resource/app_string.dart';
import '../../../../domain/entity/meal.dart';
import '../../../dto/meal_dto.dart';

class MealDatabase {
  static final MealDatabase _singleton = MealDatabase._();

  // Singleton accessor
  static MealDatabase get instance => _singleton;

  MealDatabase._();
  final _mealStore = intMapStoreFactory.store(AppString.mealTable);

  Database openDatabase = DatabaseManager.instance.db;

  Future<void> insert(Map<String, dynamic> map) async {
    await _mealStore.add(openDatabase, map);
  }

  Future<List<Meal>> getAllMeal() async {
    final snapshots = await _mealStore.find(openDatabase);
    return snapshots
        .map((infomation) => MealDto.fromJson(infomation.value))
        .toList();
  }
}
