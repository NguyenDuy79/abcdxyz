import '../../core/app.dart';
import '../entity/meal.dart';

abstract class MealRepository {
  Future<void> addMeal(Map<String, dynamic> map);
  Future<List<Meal>> getMeal();
  void onClose();
  void onDone();
  void onChage();
  Stream<Reload> get status;
}
