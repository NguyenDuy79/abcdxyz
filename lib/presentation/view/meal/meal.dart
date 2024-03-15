import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fitness_app/src/core/resource/app_another.dart';
import 'package:new_fitness_app/src/core/resource/app_dimens.dart';
import 'package:new_fitness_app/src/core/resource/app_string.dart';
import 'package:new_fitness_app/src/data/source/local/pref/pref_local.dart';
import 'package:new_fitness_app/src/domain/entity/meal.dart';
import 'package:new_fitness_app/src/presentation/view/meal/bloc/meal/meal_cubit.dart';
import 'package:new_fitness_app/src/presentation/view/meal/widget/modal_popup_widget.dart';
import 'package:new_fitness_app/src/presentation/widget/global/back_button.dart';
import 'package:new_fitness_app/src/presentation/widget/global/bottom_navigation_bar.dart';
import 'package:new_fitness_app/src/presentation/widget/global/text_field.dart';

import '../../../core/resource/app_colors.dart';
import '../../../core/resource/app_fonts.dart';
import '../../../domain/entity/food.dart';
import '../../widget/global/meal_ingredients.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(() {
              Navigator.of(context).pop();
            }),
            // const SizedBox(
            //   height: AppDimens.dimens_8,
            // ),
            Container(
              height: AppDimens.dimens_100,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: AppDimens.dimens_16),
              padding: const EdgeInsets.all(AppDimens.dimens_8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: AppDimens.dimens_1,
                      color: AppColor.pink.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
              child: BlocBuilder<MealCubit, MealState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: MealIngredientsWidget(
                              calories: valueMeal(
                                  state.listFoodChoosed, AppString.calories),
                              protein: valueMeal(
                                  state.listFoodChoosed, AppString.protein),
                              carb: valueMeal(
                                  state.listFoodChoosed, AppString.carb),
                              fat: valueMeal(
                                  state.listFoodChoosed, AppString.fat)))
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<MealCubit, MealState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppDimens.dimens_45 *
                              state.listFoodChoosed.length,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.listFoodChoosed.length,
                            itemBuilder: (context, index) => Container(
                              height: AppDimens.dimens_40,
                              padding: const EdgeInsets.all(AppDimens.dimens_5),
                              margin: const EdgeInsets.only(
                                  bottom: AppDimens.dimens_5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: AppDimens.dimens_1,
                                      color: AppColor.pink.withOpacity(0.4)),
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.dimens_16)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: AppDimens.dimens_12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.listFoodChoosed[index].values.first
                                          .name,
                                      style: const TextStyle(
                                          fontSize: AppDimens.dimens_16,
                                          fontWeight: AppFont.semiBold),
                                    ),
                                    Text(
                                        '${state.listFoodChoosed[index].keys.first.toString()}g')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppDimens.dimens_16,
                        ),
                        TextFieldWidget((value) {
                          context.read<MealCubit>().searchFood(value);
                        },
                            'Search',
                            TextInputType.text,
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: AppDimens.dimens_8),
                              child: Icon(Icons.search),
                            ),
                            false),
                        const SizedBox(
                          height: AppDimens.dimens_24,
                        ),
                        SizedBox(
                          height: AppDimens.dimens_65 * state.listFood.length,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.listFood.length,
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      final int currentFood =
                                          AppAnother.listFood.indexWhere(
                                        (element) =>
                                            state.listFood[index].name ==
                                            element.name,
                                      );

                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) =>
                                              ModalPopupWidget(
                                                currentFood,
                                              )).then((value) {
                                        if (PrefLocal().isExistKey('weight') &&
                                            PrefLocal()
                                                .isExistKey('position')) {
                                          context.read<MealCubit>().addFood(
                                              PrefLocal().getDouble('weight')!,
                                              AppAnother.listFood[PrefLocal()
                                                  .getInt('position')]);
                                        }
                                      }).then((value) {
                                        PrefLocal().clearKey('position');
                                        PrefLocal().clearKey('weight');
                                      });
                                    },
                                    child: Container(
                                      height: AppDimens.dimens_60,
                                      padding: const EdgeInsets.all(
                                          AppDimens.dimens_5),
                                      margin: const EdgeInsets.only(
                                          bottom: AppDimens.dimens_5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: AppDimens.dimens_1,
                                              color: AppColor.pink
                                                  .withOpacity(0.4)),
                                          borderRadius: BorderRadius.circular(
                                              AppDimens.dimens_16)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: AppDimens.dimens_12),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.listFood[index].name,
                                                  style: const TextStyle(
                                                      fontSize:
                                                          AppDimens.dimens_16,
                                                      fontWeight:
                                                          AppFont.semiBold),
                                                ),
                                                Text(
                                                    '${state.listFood[index].calories}kcal - 100g')
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                right: AppDimens.dimens_12),
                                            child: Icon(
                                              Icons.add,
                                              color: AppColor.pink,
                                              size: AppDimens.dimens_35,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) {
          return BottomNavigationBarWidget(() async {
            final Meal result = Meal(
                dateTime: DateTime.now().toString(),
                foods: state.listFoodChoosed);
            await context
                .read<MealCubit>()
                .enterMeal(result.toMap())
                .then((value) => Navigator.of(context).pop());
          }, state.listFoodChoosed.isNotEmpty);
        },
      ),
    );
  }
}

double valueMeal(List<Map<double, Food>> listFood, String label) {
  double result = 0;
  for (int i = 0; i < listFood.length; i++) {
    switch (label) {
      case AppString.calories:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.calories) / 100;
      case AppString.protein:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.protein) / 100;
      case AppString.carb:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.carb) / 100;
      default:
        result = result +
            listFood[i].keys.first * (listFood[i].values.first.fat) / 100;
    }
  }
  return result;
}
