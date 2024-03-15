import 'dart:async';

import '../../core/app.dart';
import '../../domain/entity/meal.dart';
import '../../domain/repository/meal_repository.dart';
import '../source/local/database/meal_database.dart';

class MealRepositoryImpl implements MealRepository {
  @override
  Future<void> addMeal(Map<String, dynamic> map) async {
    await MealDatabase.instance.insert(map);
  }

  @override
  Future<List<Meal>> getMeal() async {
    List<Meal> data = await MealDatabase.instance.getAllMeal();

    return data;
  }

  final StreamController<Reload> _controller = StreamController<Reload>();
  @override
  Stream<Reload> get status async* {
    yield Reload.yes;
    yield* _controller.stream;
  }

  @override
  void onDone() {
    _controller.add(Reload.no);
  }

  @override
  void onClose() {
    _controller.close();
  }

  @override
  void onChage() {
    _controller.add(Reload.yes);
  }
}
