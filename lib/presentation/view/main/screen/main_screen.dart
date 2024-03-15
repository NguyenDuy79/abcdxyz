import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../config/route/route_generator.dart';
import '../../../../core/funtions/day_of_week.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../bloc/main_page_cubit/main_page_index_cubit.dart';
import '../bloc/nutrition_screen/nutrition_screen_cubit_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainPageIndexCubit, int>(
        builder: (context, state) {
          return Stack(
            children: [
              RouteGenerator.listPage[state],
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    Container(
                        color: AppColor.grey1,
                        // color: AppColor.black,
                        width: double.infinity,
                        height: AppDimens.dimens_105,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(0);
                              },
                              child: SizedBox(
                                width: AppDimens.dimens_60,
                                height: AppDimens.dimens_105,
                                child: state == 0
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: AppDimens.dimens_24,
                                            width: AppDimens.dimens_52,
                                            child: Center(
                                              child: Text(
                                                'Home',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimens.dimens_14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: AppDimens.dimens_4,
                                            width: AppDimens.dimens_4,
                                            decoration: const BoxDecoration(
                                                color: AppColor.red,
                                                shape: BoxShape.circle),
                                          )
                                        ],
                                      )
                                    : const Icon(
                                        Icons.home_max_outlined,
                                        size: AppDimens.dimens_24,
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(1);
                                context
                                    .read<NutritionScreenCubitCubit>()
                                    .getTrueValue(
                                        getWeek(DateTime.now()).indexWhere(
                                      (element) =>
                                          DateFormat('E')
                                              .format(DateTime.now()) ==
                                          DateFormat('E').format(element),
                                    ));
                              },
                              child: SizedBox(
                                width: AppDimens.dimens_60,
                                height: AppDimens.dimens_105,
                                child: state == 1
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: AppDimens.dimens_24,
                                            width: AppDimens.dimens_52,
                                            child: Center(
                                              child: Text(
                                                'Nutri',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimens.dimens_14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: AppDimens.dimens_4,
                                            width: AppDimens.dimens_4,
                                            decoration: const BoxDecoration(
                                                color: AppColor.red,
                                                shape: BoxShape.circle),
                                          )
                                        ],
                                      )
                                    : const Icon(
                                        Icons.fastfood_outlined,
                                        size: AppDimens.dimens_24,
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(2);
                              },
                              child: Container(
                                // color: AppColor.grey,
                                height: AppDimens.dimens_105,
                                alignment: Alignment.topCenter,
                                width: AppDimens.dimens_60,
                                child: Container(
                                  height: AppDimens.dimens_65,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      color: AppColor.black,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    size: AppDimens.dimens_24,
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(3);
                                context
                                    .read<NutritionScreenCubitCubit>()
                                    .getTrueValue(
                                        getWeek(DateTime.now()).indexWhere(
                                      (element) =>
                                          DateFormat('E')
                                              .format(DateTime.now()) ==
                                          DateFormat('E').format(element),
                                    ));
                              },
                              child: SizedBox(
                                width: AppDimens.dimens_60,
                                child: state == 3
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: AppDimens.dimens_24,
                                            width: AppDimens.dimens_52,
                                            child: Center(
                                              child: Text(
                                                'Plan',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimens.dimens_14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: AppDimens.dimens_4,
                                            width: AppDimens.dimens_4,
                                            decoration: const BoxDecoration(
                                                color: AppColor.red,
                                                shape: BoxShape.circle),
                                          )
                                        ],
                                      )
                                    : const Icon(
                                        Icons.calendar_month_outlined,
                                        size: AppDimens.dimens_24,
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<MainPageIndexCubit>()
                                    .changePage(4);
                              },
                              child: SizedBox(
                                width: AppDimens.dimens_60,
                                child: state == 4
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            height: AppDimens.dimens_24,
                                            width: AppDimens.dimens_52,
                                            child: Center(
                                              child: Text(
                                                'More',
                                                style: TextStyle(
                                                    fontSize:
                                                        AppDimens.dimens_14),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: AppDimens.dimens_4,
                                            width: AppDimens.dimens_4,
                                            decoration: const BoxDecoration(
                                                color: AppColor.red,
                                                shape: BoxShape.circle),
                                          )
                                        ],
                                      )
                                    : const Icon(
                                        Icons.more_horiz,
                                        size: AppDimens.dimens_24,
                                      ),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
