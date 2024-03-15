import 'package:fitness_and_nutrition/core/funtions/day_of_week.dart';
import 'package:intl/intl.dart';
import '../../domain/entity/meal.dart';
import '../../domain/entity/water.dart';

List<Meal> getMealOfDay(List<Meal> listMeal, int choose) {
  List<Meal> newList = [];
  for (int i = 0; i < listMeal.length; i++) {
    if (checkMeal(listMeal[i].dateTime, getWeek(DateTime.now())[choose]) == 0) {
      newList.add(listMeal[i]);
    }
  }
  return newList;
}

Water? getWaterToday(List<Water> water, int choose) {
  for (int i = 0; i < water.length; i++) {
    if (checkMeal(water[i].dateTime, getWeek(DateTime.now())[choose]) == 0) {
      return water[i];
    }
  }
  return null;
}

int checkMeal(String dateTimeMeal, DateTime dateTime) {
  return dateTime
      .difference(DateTime.parse(
          DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTimeMeal))))
      .inDays;
}
