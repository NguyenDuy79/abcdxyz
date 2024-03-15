import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../config/route/route_generator.dart';
import '../../../../../core/funtions/get_value_meal.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../../../../domain/entity/meal.dart';
import '../../../../widget/global/meal_ingredients.dart';
import '../../../../widget/global/nutri_circular_progress.dart';

class CaloriesWidget extends StatelessWidget {
  const CaloriesWidget(
      {super.key,
      required this.sizeScreen,
      required this.caloriesPerDay,
      required this.caloriesToday,
      required this.proteinPerDay,
      required this.proteinToday,
      required this.carbPerDay,
      required this.carbToday,
      required this.fatPerDay,
      required this.fatToday,
      required this.newlist,
      required this.checkToday});
  final Size sizeScreen;
  final double caloriesPerDay;
  final double caloriesToday;
  final double proteinPerDay;
  final double proteinToday;
  final double carbPerDay;
  final double carbToday;
  final double fatPerDay;
  final double fatToday;
  final List<Meal> newlist;
  final bool checkToday;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircularPercentIndicator(
            radius: sizeScreen.width * 0.33,
            lineWidth: AppDimens.dimens_14,
            circularStrokeCap: CircularStrokeCap.round,
            percent: caloriesPerDay == 0
                ? 0
                : (caloriesToday / caloriesPerDay) > 1
                    ? 1
                    : (caloriesToday / caloriesPerDay),
            backgroundColor: AppColor.pink.withOpacity(0.1),
            progressColor: AppColor.pink,
            center: FittedBox(
                child: RichText(
                    text: TextSpan(children: [
              TextSpan(
                  text: caloriesToday.toStringAsFixed(1),
                  style: TextStyle(
                      fontSize: AppDimens.dimens_32,
                      fontWeight: AppFont.semiBold,
                      color: (caloriesToday / caloriesPerDay) > 1
                          ? AppColor.red
                          : AppColor.pink)),
              TextSpan(
                  text: '/${caloriesPerDay.toStringAsFixed(0)} kcal',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_22,
                      fontWeight: AppFont.semiBold,
                      color: AppColor.black.withOpacity(0.5)))
            ]))),
          ),
        ),
        const SizedBox(
          height: AppDimens.dimens_16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NutriCircularProgress(
              percent: proteinPerDay == 0
                  ? 0
                  : (proteinToday / proteinPerDay) > 1
                      ? 1
                      : (proteinToday / proteinPerDay),
              radius: AppDimens.dimens_20,
              color: AppColor.orange,
              opacity: 0.1,
              fontWeight: AppFont.semiBold,
              fontSize: AppDimens.dimens_14,
              text: ((proteinPerDay == 0 ? 0 : (proteinToday / proteinPerDay)) *
                      100)
                  .toStringAsFixed(1),
              label: AppString.protein,
              value: proteinPerDay,
              textLabelSize: AppDimens.dimens_18,
              textValueSize: AppDimens.dimens_14,
            ),
            NutriCircularProgress(
              percent: fatPerDay == 0
                  ? 0
                  : (fatToday / fatPerDay) > 1
                      ? 1
                      : (fatToday / fatPerDay),
              radius: AppDimens.dimens_20,
              color: AppColor.yellow,
              opacity: 0.1,
              fontWeight: AppFont.semiBold,
              fontSize: AppDimens.dimens_14,
              text: ((fatPerDay == 0 ? 0 : (fatToday / fatPerDay)) * 100)
                  .toStringAsFixed(1),
              label: AppString.fat,
              value: fatPerDay,
              textLabelSize: AppDimens.dimens_18,
              textValueSize: AppDimens.dimens_14,
            ),
            NutriCircularProgress(
              percent: carbPerDay == 0
                  ? 0
                  : (carbToday / carbPerDay) > 1
                      ? 1
                      : (carbToday / carbPerDay),
              radius: AppDimens.dimens_20,
              color: AppColor.red,
              opacity: 0.1,
              fontWeight: AppFont.semiBold,
              fontSize: AppDimens.dimens_14,
              text: ((carbPerDay == 0 ? 0 : (carbToday / carbPerDay)) * 100)
                  .toStringAsFixed(1),
              label: AppString.carb,
              value: carbPerDay,
              textLabelSize: AppDimens.dimens_18,
              textValueSize: AppDimens.dimens_14,
            ),
          ],
        ),
        if (checkToday)
          const SizedBox(
            height: AppDimens.dimens_16,
          ),
        if (checkToday)
          const Text(
            'Bữa ăn hôm nay',
            style: TextStyle(
                fontSize: AppDimens.dimens_18, fontWeight: AppFont.semiBold),
          ),
        if (checkToday)
          const SizedBox(
            height: AppDimens.dimens_16,
          ),
        if (checkToday)
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(RouteGenerator.mealScreen);
            },
            child: Container(
              height: AppDimens.dimens_130,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: AppDimens.dimens_1,
                      color: AppColor.pink.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
              child: const Icon(
                Icons.add_circle_outline_sharp,
                color: AppColor.pink,
                size: AppDimens.dimens_42,
              ),
            ),
          ),
        const SizedBox(
          height: AppDimens.dimens_16,
        ),
        SizedBox(
          height: AppDimens.dimens_130 * newlist.length +
              AppDimens.dimens_15 * newlist.length,
          child: ListView.builder(
              reverse: true,
              itemCount: newlist.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: AppDimens.dimens_130,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: AppDimens.dimens_16),
                    padding: const EdgeInsets.all(AppDimens.dimens_8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimens.dimens_1,
                            color: AppColor.pink.withOpacity(0.5)),
                        borderRadius:
                            BorderRadius.circular(AppDimens.dimens_16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bữa ăn lúc ${dateTime(newlist[index].dateTime)} ',
                          style: const TextStyle(
                              fontSize: AppDimens.dimens_18,
                              fontWeight: AppFont.semiBold),
                        ),
                        Expanded(
                            child: MealIngredientsWidget(
                                calories: valueMeal(
                                    newlist[index].foods, AppString.calories),
                                protein: valueMeal(
                                    newlist[index].foods, AppString.protein),
                                carb: valueMeal(
                                    newlist[index].foods, AppString.carb),
                                fat: valueMeal(
                                    newlist[index].foods, AppString.fat)))
                      ],
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: AppDimens.dimens_110,
        )
      ],
    );
  }
}

String dateTime(String dateTime) {
  return DateFormat('HH:mm').format(DateTime.parse(dateTime));
}
