import '../../../core/app.dart';
import '../../../core/use_case/use_case.dart';
import '../../repository/meal_repository.dart';

class InsretMealUseCase extends UserCase<void, Map<String, dynamic>> {
  final MealRepository _mealRepository;
  InsretMealUseCase(this._mealRepository);
  @override
  Future<void> call({required Map<String, dynamic> params}) async {
    await _mealRepository.addMeal(params);
  }

  @override
  void onClose() {
    _mealRepository.onClose();
  }

  @override
  void onDone() {
    _mealRepository.onDone();
  }

  @override
  Stream<Reload> get status => _mealRepository.status;

  @override
  void onChange() {
    _mealRepository.onChage();
  }
}
