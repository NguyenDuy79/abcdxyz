part of 'nutri_cubit.dart';

class NutriState extends Equatable {
  const NutriState(this.listMeal);
  final List<Meal> listMeal;
  @override
  List<Object> get props => [listMeal];
}
