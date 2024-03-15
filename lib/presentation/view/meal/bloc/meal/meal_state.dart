part of 'meal_cubit.dart';

class MealState extends Equatable {
  const MealState(
      {this.listFood = AppAnother.listFood,
      this.listFoodChoosed = const [],
      this.errorText = ''});
  final List<Food> listFood;
  final List<Map<double, Food>> listFoodChoosed;
  final String errorText;

  MealState copyWith(
      {List<Food>? listFood,
      List<Map<double, Food>>? listFoodChoosed,
      String? errorText}) {
    return MealState(
        listFood: listFood ?? this.listFood,
        listFoodChoosed: listFoodChoosed ?? this.listFoodChoosed,
        errorText: errorText ?? this.errorText);
  }

  @override
  List<Object> get props => [listFood, listFoodChoosed, errorText];
}
