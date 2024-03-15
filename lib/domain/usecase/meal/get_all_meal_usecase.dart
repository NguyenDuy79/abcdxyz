import '../../../core/use_case/use_case.dart';
import '../../entity/meal.dart';
import '../../repository/meal_repository.dart';

class GetAllMealUseCase implements UserCaseNoParams<void> {
  final MealRepository _mealRepository;
  GetAllMealUseCase(this._mealRepository);
  @override
  Future<List<Meal>> call() async {
    return await _mealRepository.getMeal();
  }
}
