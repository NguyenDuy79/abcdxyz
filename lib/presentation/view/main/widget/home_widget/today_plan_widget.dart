import 'package:flutter/material.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class TodayPlan extends StatelessWidget {
  const TodayPlan({super.key});
  static const List<String> image = [
    'assets/images/dumbbell.png',
    'assets/images/yoga.png',
    'assets/images/calisthenics.png',
    'assets/images/cardio.png'
  ];
  static const List<String> name = [
    'Gym',
    'Yoga',
    'Calis',
    'Cardio',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kế hoạch ngày hôm nay',
          style: TextStyle(
              fontSize: AppDimens.dimens_18, fontWeight: AppFont.semiBold),
        ),
        const SizedBox(
          height: AppDimens.dimens_24,
        ),
        SizedBox(
          height: AppDimens.dimens_104,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                // margin: const EdgeInsets.only(right: AppDimens.dimens_16),
                height: AppDimens.dimens_104,
                width: AppDimens.dimens_96,
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: AppDimens.dimens_64,
                          width: AppDimens.dimens_64,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.dimens_24),
                                    gradient: LinearGradient(
                                        colors: [
                                          AppColor.pink,
                                          AppColor.pink.withOpacity(0.5)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                              ),
                              Center(
                                child: Image.asset(
                                  image[index],
                                  width: AppDimens.dimens_36,
                                  height: AppDimens.dimens_36,
                                  color: AppColor.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: AppDimens.dimens_16,
                        ),
                        SizedBox(
                          height: AppDimens.dimens_24,
                          child: Text(
                            name[index],
                            style: const TextStyle(
                                fontSize: AppDimens.dimens_14,
                                fontWeight: AppFont.semiBold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: 4,
          ),
        )
      ],
    );
  }
}
