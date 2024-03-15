import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/funtions/calculate_calories.dart';
import '../../../../core/funtions/day_of_week.dart';
import '../../../../core/funtions/get_index.dart';
import '../../../../core/funtions/get_meal_of_day.dart';
import '../../../../core/funtions/get_value_meal.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../../../../core/resource/app_string.dart';
import '../../../../domain/entity/infomation.dart';
import '../../../../domain/entity/meal.dart';
import '../../../../domain/entity/water.dart';
import '../../../bloc/infotion_cubit/infomation_cubit.dart';
import '../../../bloc/nutri_cubit/nutri_cubit.dart';
import '../../../bloc/water_cubit/water_cubit.dart';
import '../bloc/nutrition_screen/nutrition_screen_cubit_cubit.dart';
import '../widget/nutrition_widget.dart/calendar_item.dart';
import '../widget/nutrition_widget.dart/calories_widget.dart';
import '../widget/nutrition_widget.dart/water_widget.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocBuilder<InfomationCubit, InfomationState>(
        builder: (context, stateInfo) {
          return BlocBuilder<NutritionScreenCubitCubit,
              NutritionScreenCubitState>(
            builder: (context, stateNutriScreen) {
              return BlocBuilder<WaterCubit, WaterState>(
                builder: (context, stateWater) {
                  return BlocBuilder<NutriCubit, NutriState>(
                    builder: (context, state) {
                      final List<Meal> newlist =
                          getMealOfDay(state.listMeal, stateNutriScreen.choose);
                      final caloriesToday =
                          valueMealOfDay(newlist, AppString.calories);
                      final proteinToday =
                          valueMealOfDay(newlist, AppString.protein);
                      final carbToday = valueMealOfDay(newlist, AppString.carb);
                      final fatToday = valueMealOfDay(newlist, AppString.fat);
                      final bool checkToday = getWeek(
                              DateTime.now())[stateNutriScreen.choose] ==
                          DateTime.parse(
                              DateFormat('yyyy-MM-dd').format(DateTime.now()));
                      final Water? water = getWaterToday(
                          stateWater.listWater, stateNutriScreen.choose);
                      double caloriesPerDay;
                      double proteinPerDay;
                      double fatPerDay;
                      double carbPerDay;

                      if (getIndex(stateInfo.listInfomation,
                              stateNutriScreen.choose) <
                          0) {
                        caloriesPerDay = 0;
                        fatPerDay = 0;
                        carbPerDay = 0;
                        proteinPerDay = 0;
                      } else {
                        Infomation infomation = stateInfo.listInfomation[
                            getIndex(stateInfo.listInfomation,
                                stateNutriScreen.choose)];
                        caloriesPerDay = getCalories(
                            infomation.bodyFat,
                            infomation.weight,
                            infomation.dayTraining,
                            infomation.goal);
                        proteinPerDay =
                            caloriesPerDay * infomation.protein / 100 / 4;
                        fatPerDay = caloriesPerDay * infomation.fat / 100 / 9;
                        carbPerDay =
                            caloriesPerDay * infomation.carbs / 100 / 4;
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.dimens_24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppDimens.dimens_28,
                              child: Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  GestureDetector(
                                      onTap: () {
                                        context
                                            .read<NutritionScreenCubitCubit>()
                                            .changeCalories();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.change_circle,
                                            size: AppDimens.dimens_28,
                                            color: stateNutriScreen.calories
                                                ? AppColor.pink
                                                : AppColor.blue,
                                          ),
                                          const SizedBox(
                                            width: AppDimens.dimens_5,
                                          ),
                                          Text(
                                              stateNutriScreen.calories
                                                  ? 'Calories'
                                                  : 'Water',
                                              style: const TextStyle(
                                                fontSize: AppDimens.dimens_18,
                                                fontWeight: AppFont.semiBold,
                                              ))
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppDimens.dimens_16,
                            ),
                            SizedBox(
                                height: (sizeScreen.width -
                                        AppDimens.dimens_24 * 2) /
                                    7,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (int i = 0; i < 7; i++)
                                      CalendarItemWidget(
                                          sizeScreen,
                                          getWeek(DateTime.now())[i],
                                          i == stateNutriScreen.choose,
                                          i,
                                          stateNutriScreen.calories)
                                  ],
                                )),
                            const SizedBox(
                              height: AppDimens.dimens_16,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                  child: stateNutriScreen.calories
                                      ? CaloriesWidget(
                                          sizeScreen: sizeScreen,
                                          caloriesPerDay: caloriesPerDay,
                                          caloriesToday: caloriesToday,
                                          proteinPerDay: proteinPerDay,
                                          proteinToday: proteinToday,
                                          carbPerDay: carbPerDay,
                                          carbToday: carbToday,
                                          fatPerDay: fatPerDay,
                                          fatToday: fatToday,
                                          newlist: newlist,
                                          checkToday: checkToday)
                                      : WaterWidget(
                                          sizeScreen: sizeScreen,
                                          water: stateNutriScreen.water,
                                          waterToday: water,
                                          checkToday: checkToday,
                                        )),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
