import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/funtions/calculate_calories.dart';
import '../../../../../core/funtions/day_of_week.dart';
import '../../../../../core/funtions/get_index.dart';
import '../../../../../core/funtions/get_meal_of_day.dart';
import '../../../../../core/funtions/get_value_meal.dart';
import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../../../../domain/entity/meal.dart';
import '../../../../bloc/infotion_cubit/infomation_cubit.dart';
import '../../../../bloc/nutri_cubit/nutri_cubit.dart';
import '../../../../widget/global/nutri_circular_progress.dart';

class TodayInfomation extends StatefulWidget {
  const TodayInfomation(this.screenSize, {super.key});
  final Size screenSize;

  @override
  State<TodayInfomation> createState() => _TodayInfomationState();
}

class _TodayInfomationState extends State<TodayInfomation> {
  PageController controller1 = PageController();
  PageController controller2 = PageController();
  PageController controller3 = PageController();
  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.dimens_24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppDimens.dimens_28,
            child: Text(
              'Thông tin ngày hôm nay',
              style: TextStyle(
                  fontSize: AppDimens.dimens_18, fontWeight: AppFont.semiBold),
            ),
          ),
          const SizedBox(
            height: AppDimens.dimens_24,
          ),
          SizedBox(
            height: (widget.screenSize.width -
                    AppDimens.dimens_24 * 2 -
                    AppDimens.dimens_15) /
                2 *
                1.6,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (widget.screenSize.width -
                              AppDimens.dimens_24 * 2 -
                              AppDimens.dimens_15) /
                          2,
                      height: (widget.screenSize.width -
                              AppDimens.dimens_24 * 2 -
                              AppDimens.dimens_15) /
                          2 *
                          0.75,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimens.dimens_24),
                        border: Border.all(
                            width: AppDimens.dimens_1,
                            color: AppColor.black.withOpacity(0.1)),
                      ),
                      child: PageView(
                        controller: controller1,
                        scrollDirection: Axis.vertical,
                        padEnds: false,
                        children: [
                          Container(
                            width: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2,
                            height: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2 *
                                0.75,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.dimens_16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: AppDimens.dimens_24,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Tập luyện',
                                        style: TextStyle(
                                            fontWeight: AppFont.semiBold,
                                            fontSize: AppDimens.dimens_14),
                                      ),
                                      Image.asset(
                                        'assets/images/calisthenics.png',
                                        color: AppColor.pink,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: AppDimens.dimens_16,
                                ),
                                const Text(
                                  '60',
                                  style: TextStyle(
                                      fontWeight: AppFont.bold,
                                      fontSize: AppDimens.dimens_18),
                                ),
                                Text(
                                  'Phút',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_12,
                                      color: AppColor.black.withOpacity(0.4)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2,
                            height: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2 *
                                0.75,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.dimens_16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: AppDimens.dimens_24,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Calo',
                                        style: TextStyle(
                                            fontWeight: AppFont.semiBold,
                                            fontSize: AppDimens.dimens_14),
                                      ),
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        size: AppDimens.dimens_24,
                                        color: AppColor.pink,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: AppDimens.dimens_16,
                                ),
                                const Text(
                                  '120',
                                  style: TextStyle(
                                      fontWeight: AppFont.bold,
                                      fontSize: AppDimens.dimens_18),
                                ),
                                Text(
                                  'Kcal',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_12,
                                      color: AppColor.black.withOpacity(0.4)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: (widget.screenSize.width -
                              AppDimens.dimens_24 * 2 -
                              AppDimens.dimens_15) /
                          2,
                      height: (widget.screenSize.width -
                              AppDimens.dimens_24 * 2 -
                              AppDimens.dimens_15) /
                          2 *
                          0.75,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimens.dimens_24),
                        border: Border.all(
                            width: AppDimens.dimens_1,
                            color: AppColor.black.withOpacity(0.1)),
                      ),
                      child: PageView(
                        controller: controller2,
                        scrollDirection: Axis.vertical,
                        padEnds: false,
                        children: [
                          Container(
                            width: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2,
                            height: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2 *
                                0.75,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.dimens_16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: AppDimens.dimens_24,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Số bước',
                                          style: TextStyle(
                                              fontWeight: AppFont.semiBold,
                                              fontSize: AppDimens.dimens_14)),
                                      Icon(
                                        Icons.directions_walk,
                                        color: AppColor.pink,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: AppDimens.dimens_16,
                                ),
                                const Text(
                                  '1234',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_18,
                                      fontWeight: AppFont.bold),
                                ),
                                Text(
                                  'Bước',
                                  style: TextStyle(
                                      fontSize: AppDimens.dimens_12,
                                      color: AppColor.black.withOpacity(0.4)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2,
                            height: (widget.screenSize.width -
                                    AppDimens.dimens_24 * 2 -
                                    AppDimens.dimens_15) /
                                2 *
                                0.75,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.dimens_16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: AppDimens.dimens_24,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Nước uống',
                                          style: TextStyle(
                                              fontWeight: AppFont.semiBold,
                                              fontSize: AppDimens.dimens_14)),
                                      Icon(
                                        Icons.water_drop_outlined,
                                        color: AppColor.blue,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: AppDimens.dimens_16,
                                ),
                                SizedBox(
                                  height: AppDimens.dimens_16,
                                  child: Column(
                                    children: [
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                      SizedBox(
                                        height: AppDimens.dimens_8,
                                        width: (widget.screenSize.width -
                                                    AppDimens.dimens_24 * 2 -
                                                    AppDimens.dimens_15) /
                                                2 -
                                            AppDimens.dimens_16 * 2,
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                                // height: AppDimens.dimens_8,
                                                decoration: BoxDecoration(
                                              color: AppColor.blue
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                            FractionallySizedBox(
                                              widthFactor: 0.5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColor.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                    ],
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  const TextSpan(
                                      text: '0.95/2 ',
                                      style: TextStyle(
                                          fontSize: AppDimens.dimens_12,
                                          fontWeight: AppFont.bold,
                                          color: AppColor.black)),
                                  TextSpan(
                                      text: 'lít',
                                      style: TextStyle(
                                          fontSize: AppDimens.dimens_12,
                                          color:
                                              AppColor.black.withOpacity(0.4)))
                                ]))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: AppDimens.dimens_15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: (widget.screenSize.width -
                                AppDimens.dimens_24 * 2 -
                                AppDimens.dimens_15) /
                            2 *
                            0.75,
                        alignment: const Alignment(0, -0.6),
                        child: SmoothPageIndicator(
                          axisDirection: Axis.vertical,
                          controller: controller1,
                          count: 2,
                          effect: WormEffect(
                              strokeWidth: AppDimens.dimens_0,
                              dotColor: AppColor.blue.withOpacity(0.5),
                              dotHeight: AppDimens.dimens_5,
                              dotWidth: AppDimens.dimens_10,
                              activeDotColor: AppColor.pink,
                              spacing: AppDimens.dimens_10,
                              paintStyle: PaintingStyle.fill),
                        ),
                      ),
                      Container(
                        height: (widget.screenSize.width -
                                AppDimens.dimens_24 * 2 -
                                AppDimens.dimens_15) /
                            2 *
                            0.75,
                        alignment: const Alignment(0, -0.6),
                        child: SmoothPageIndicator(
                          axisDirection: Axis.vertical,
                          controller: controller2,
                          count: 2,
                          effect: WormEffect(
                              strokeWidth: AppDimens.dimens_0,
                              dotColor: AppColor.blue.withOpacity(0.5),
                              dotHeight: AppDimens.dimens_5,
                              dotWidth: AppDimens.dimens_10,
                              activeDotColor: AppColor.pink,
                              spacing: AppDimens.dimens_10,
                              paintStyle: PaintingStyle.fill),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: (widget.screenSize.width -
                          AppDimens.dimens_24 * 2 -
                          AppDimens.dimens_15) /
                      2,
                  height: (widget.screenSize.width -
                          AppDimens.dimens_24 * 2 -
                          AppDimens.dimens_15) /
                      2 *
                      1.6,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: AppDimens.dimens_1,
                          color: AppColor.black.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(AppDimens.dimens_24)),
                  child: PageView(
                    controller: controller3,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: (widget.screenSize.width -
                                AppDimens.dimens_24 * 2 -
                                AppDimens.dimens_15) /
                            2,
                        height: (widget.screenSize.width -
                                AppDimens.dimens_24 * 2 -
                                AppDimens.dimens_15) /
                            2 *
                            1.6,
                        padding: const EdgeInsets.all(AppDimens.dimens_16),
                        child: BlocBuilder<InfomationCubit, InfomationState>(
                          builder: (context, state) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: AppDimens.dimens_24,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Thân hình',
                                        style: TextStyle(
                                            fontWeight: AppFont.semiBold,
                                            fontSize: AppDimens.dimens_14),
                                      ),
                                      Icon(
                                        Icons.boy_rounded,
                                        size: AppDimens.dimens_24,
                                        color: AppColor.pink,
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: AppDimens.dimens_6,
                                      height: AppDimens.dimens_6,
                                      decoration: const BoxDecoration(
                                          color: AppColor.red,
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: AppDimens.dimens_4,
                                    ),
                                    Text(
                                      'Tuổi: ${getAge(state.listInfomation.last.dateOfBirth)}',
                                      style: const TextStyle(
                                        fontWeight: AppFont.semiBold,
                                        fontSize: AppDimens.dimens_14,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: AppDimens.dimens_6,
                                      height: AppDimens.dimens_6,
                                      decoration: const BoxDecoration(
                                          color: AppColor.yellow,
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: AppDimens.dimens_4,
                                    ),
                                    Text(
                                      'Cao: ${state.listInfomation.last.height}cm',
                                      style: const TextStyle(
                                        fontWeight: AppFont.semiBold,
                                        fontSize: AppDimens.dimens_14,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: AppDimens.dimens_6,
                                      height: AppDimens.dimens_6,
                                      decoration: const BoxDecoration(
                                          color: AppColor.purple,
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: AppDimens.dimens_4,
                                    ),
                                    Text(
                                      'Nặng: ${state.listInfomation.last.weight}kg',
                                      style: const TextStyle(
                                        fontWeight: AppFont.semiBold,
                                        fontSize: AppDimens.dimens_14,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: AppDimens.dimens_6,
                                      height: AppDimens.dimens_6,
                                      decoration: const BoxDecoration(
                                          color: AppColor.red,
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: AppDimens.dimens_4,
                                    ),
                                    Text(
                                      'Mỡ: ${state.listInfomation.last.bodyFat}%',
                                      style: const TextStyle(
                                        fontWeight: AppFont.semiBold,
                                        fontSize: AppDimens.dimens_14,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        width: (widget.screenSize.width -
                                AppDimens.dimens_24 * 2 -
                                AppDimens.dimens_15) /
                            2,
                        height: (widget.screenSize.width -
                                AppDimens.dimens_24 * 2 -
                                AppDimens.dimens_15) /
                            2 *
                            1.6,
                        padding: const EdgeInsets.all(AppDimens.dimens_16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              height: AppDimens.dimens_24,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Dinh dưỡng',
                                    style: TextStyle(
                                        fontWeight: AppFont.semiBold,
                                        fontSize: AppDimens.dimens_14),
                                  ),
                                  Icon(
                                    Icons.lunch_dining_outlined,
                                    size: AppDimens.dimens_24,
                                    color: AppColor.pink,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child:
                                  BlocBuilder<InfomationCubit, InfomationState>(
                                builder: (context, state) {
                                  return BlocBuilder<NutriCubit, NutriState>(
                                    builder: (context, stateNutri) {
                                      final int datimeIndex =
                                          getWeek(DateTime.now()).indexWhere(
                                              (element) =>
                                                  DateFormat('E')
                                                      .format(DateTime.now()) ==
                                                  DateFormat('E')
                                                      .format(element));
                                      List<Meal> newList = getMealOfDay(
                                          stateNutri.listMeal, datimeIndex);
                                      final caloriesToday = valueMealOfDay(
                                          newList, AppString.calories);
                                      final proteinToday = valueMealOfDay(
                                          newList, AppString.protein);
                                      final carbToday = valueMealOfDay(
                                          newList, AppString.carb);
                                      final fatToday = valueMealOfDay(
                                          newList, AppString.fat);
                                      double caloriesPerDay = getCalories(
                                          state
                                              .listInfomation[getIndex(
                                                  state.listInfomation,
                                                  datimeIndex)]
                                              .bodyFat,
                                          state
                                              .listInfomation[getIndex(
                                                  state.listInfomation,
                                                  datimeIndex)]
                                              .weight,
                                          state
                                              .listInfomation[getIndex(
                                                  state.listInfomation,
                                                  datimeIndex)]
                                              .dayTraining,
                                          state
                                              .listInfomation[getIndex(
                                                  state.listInfomation,
                                                  datimeIndex)]
                                              .goal);
                                      final double proteinPerDay =
                                          caloriesPerDay *
                                              state
                                                  .listInfomation[getIndex(
                                                      state.listInfomation,
                                                      datimeIndex)]
                                                  .protein /
                                              100 /
                                              4;
                                      final double fatPerDay = caloriesPerDay *
                                          state
                                              .listInfomation[getIndex(
                                                  state.listInfomation,
                                                  datimeIndex)]
                                              .fat /
                                          100 /
                                          9;
                                      final double carbPerDay = caloriesPerDay *
                                          state
                                              .listInfomation[getIndex(
                                                  state.listInfomation,
                                                  datimeIndex)]
                                              .carbs /
                                          100 /
                                          4;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          NutriCircularProgress(
                                            percent: (caloriesToday /
                                                        caloriesPerDay) >
                                                    1
                                                ? 1
                                                : (caloriesToday /
                                                    caloriesPerDay),
                                            radius: AppDimens.dimens_20,
                                            color: AppColor.pink,
                                            opacity: 0.1,
                                            fontWeight: AppFont.semiBold,
                                            fontSize: AppDimens.dimens_14,
                                            text: (caloriesToday /
                                                    caloriesPerDay *
                                                    100)
                                                .toStringAsFixed(1),
                                            label: AppString.calories,
                                            value: caloriesToday,
                                            textLabelSize: AppDimens.dimens_16,
                                            textValueSize: AppDimens.dimens_13,
                                          ),
                                          NutriCircularProgress(
                                            percent:
                                                (proteinToday / proteinPerDay) >
                                                        1
                                                    ? 1
                                                    : (proteinToday /
                                                        proteinPerDay),
                                            radius: AppDimens.dimens_20,
                                            color: AppColor.orange,
                                            opacity: 0.1,
                                            fontWeight: AppFont.semiBold,
                                            fontSize: AppDimens.dimens_14,
                                            text: (((proteinToday /
                                                        proteinPerDay)) *
                                                    100)
                                                .toStringAsFixed(1),
                                            label: AppString.protein,
                                            value: proteinToday,
                                            textLabelSize: AppDimens.dimens_16,
                                            textValueSize: AppDimens.dimens_13,
                                          ),
                                          NutriCircularProgress(
                                            percent: (fatToday / fatPerDay) > 1
                                                ? 1
                                                : (fatToday / fatPerDay),
                                            radius: AppDimens.dimens_20,
                                            color: AppColor.yellow,
                                            opacity: 0.1,
                                            fontWeight: AppFont.semiBold,
                                            fontSize: AppDimens.dimens_14,
                                            text:
                                                (((fatToday / fatPerDay)) * 100)
                                                    .toStringAsFixed(1),
                                            label: AppString.fat,
                                            value: fatToday,
                                            textLabelSize: AppDimens.dimens_16,
                                            textValueSize: AppDimens.dimens_13,
                                          ),
                                          NutriCircularProgress(
                                            percent:
                                                (carbToday / carbPerDay) > 1
                                                    ? 1
                                                    : (carbToday / carbPerDay),
                                            radius: AppDimens.dimens_20,
                                            color: AppColor.red,
                                            opacity: 0.1,
                                            fontWeight: AppFont.semiBold,
                                            fontSize: AppDimens.dimens_14,
                                            text: (((carbToday / carbPerDay)) *
                                                    100)
                                                .toStringAsFixed(1),
                                            label: AppString.carb,
                                            value: carbToday,
                                            textLabelSize: AppDimens.dimens_16,
                                            textValueSize: AppDimens.dimens_13,
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: AppDimens.dimens_24,
                  alignment: const Alignment(0, -0.8),
                  child: SmoothPageIndicator(
                    axisDirection: Axis.vertical,
                    controller: controller3,
                    count: 2,
                    effect: WormEffect(
                        strokeWidth: AppDimens.dimens_0,
                        dotColor: AppColor.blue.withOpacity(0.5),
                        dotHeight: AppDimens.dimens_5,
                        dotWidth: AppDimens.dimens_10,
                        activeDotColor: AppColor.pink,
                        spacing: AppDimens.dimens_10,
                        paintStyle: PaintingStyle.fill),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int getAge(String dateOfBirth) {
  DateTime dateTime = DateTime.now();
  return (DateTime.parse(dateOfBirth.replaceAll('/', ''))
              .difference(dateTime)
              .inDays ~/
          365.25)
      .abs();
}
