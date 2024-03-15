import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_fitness_app/src/core/resource/app_another.dart';
import 'package:new_fitness_app/src/domain/entity/food.dart';
import 'package:new_fitness_app/src/domain/usecase/meal/insert_meal_usecase.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit({required InsretMealUseCase insretMealUseCase})
      : _insretMealUseCase = insretMealUseCase,
        super(const MealState());
  late final InsretMealUseCase _insretMealUseCase;
  void searchFood(String name) {
    List<Food> newList = [];
    for (int i = 0; i < AppAnother.listFood.length; i++) {
      if (AppAnother.listFood[i].name
          .toLowerCase()
          .contains(name.toLowerCase())) {
        newList.add(AppAnother.listFood[i]);
      }
    }
    emit(state.copyWith(listFood: newList));
  }

  void addFood(double weight, Food food) {
    List<Map<double, Food>> newList = [];
    bool check = false;
    for (int i = 0; i < state.listFoodChoosed.length; i++) {
      if (state.listFoodChoosed[i].values.first.name == food.name) {
        check = true;
        Map<double, Food> newMap = {
          state.listFoodChoosed[i].keys.first + weight: food
        };
        newList.add(newMap);
      } else {
        newList.add(state.listFoodChoosed[i]);
      }
    }
    if (!check) {
      newList.add({weight: food});
    }

    emit(state.copyWith(listFoodChoosed: newList));
  }

  Future<void> enterMeal(Map<String, dynamic> map) async {
    await _insretMealUseCase.call(params: map);
    _insretMealUseCase.onChange();
  }
}
