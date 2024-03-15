import 'package:fitness_and_nutrition/core/resource/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';
import '../widget/home_widget/time_exercise_widget.dart';
import '../widget/home_widget/today_infomation_widget.dart';
import '../widget/home_widget/today_plan_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context).scaffoldBackgroundColor;
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      height: AppDimens.dimens_58,
                      width: AppDimens.dimens_58,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.pink),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: AppDimens.dimens_24,
                          child: const Text(
                            'Xin chào Liệu',
                            style: TextStyle(fontSize: 14),
                          )),
                      Container(
                        alignment: Alignment.center,
                        height: AppDimens.dimens_28,
                        child: const Text(
                          'Thứ 6, 07 Tháng 9',
                          style: TextStyle(
                              fontSize: 18, fontWeight: AppFont.semiBold),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: AppDimens.dimens_58,
                    width: AppDimens.dimens_58,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: AppDimens.dimens_1,
                            color: AppColor.black.withOpacity(0.1)),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.notifications_none,
                      size: AppDimens.dimens_24,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_36,
            ),
            TodayInfomation(screenSize),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
              child: TodayPlan(),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.dimens_24),
              child: TimeExerciseWidget(),
            ),
            const SizedBox(
              height: AppDimens.dimens_104,
            )
          ],
        ),
      ),
    );
  }
}
