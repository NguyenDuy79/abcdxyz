import 'package:flutter/material.dart';

import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../core/resource/app_fonts.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.dimens_24, vertical: AppDimens.dimens_16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: (sizeScreen.width - AppDimens.dimens_24 * 2) / 7,
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                )),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            const SizedBox(
              height: AppDimens.dimens_250,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ' Calisthenics',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_18,
                            fontWeight: AppFont.semiBold),
                      ),
                      Text(
                        'Chest',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_14,
                            fontWeight: AppFont.semiBold),
                      ),
                      Text('Bench press'),
                      Text('Dumbbell press'),
                      Text(
                        'Calisthenics',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_18,
                            fontWeight: AppFont.semiBold),
                      ),
                      Text(
                        'Chest',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_14,
                            fontWeight: AppFont.semiBold),
                      ),
                      Text('Bench press'),
                      Text('Dumbbell press'),
                      Text(
                        'Calisthenics',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_18,
                            fontWeight: AppFont.semiBold),
                      ),
                      Text(
                        'Chest',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_14,
                            fontWeight: AppFont.semiBold),
                      ),
                      Text('Bench press'),
                      Text('Dumbbell press')
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            const Text(
              'Lịch tập luyện ',
              style: TextStyle(
                  fontSize: AppDimens.dimens_18, fontWeight: AppFont.semiBold),
            ),
            const SizedBox(
              height: AppDimens.dimens_24,
            ),
            Container(
              height: AppDimens.dimens_104,
              margin: const EdgeInsets.only(bottom: AppDimens.dimens_16),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: AppDimens.dimens_1,
                      color: AppColor.pink.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(AppDimens.dimens_24)),
              child: const Icon(
                Icons.add_circle_outline_sharp,
                size: AppDimens.dimens_42,
                color: AppColor.pink,
              ),
            ),
            SizedBox(
              height: (AppDimens.dimens_104 + AppDimens.dimens_16) * 4,
              width: double.infinity,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: AppDimens.dimens_104,
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppDimens.dimens_16),
                      margin:
                          const EdgeInsets.only(bottom: AppDimens.dimens_15),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDimens.dimens_24),
                          border: Border.all(
                              width: AppDimens.dimens_1,
                              color: AppColor.pink.withOpacity(0.5))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tên lịch tập',
                            style: TextStyle(
                                fontSize: AppDimens.dimens_18,
                                fontWeight: AppFont.semiBold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Số ngày tập luyện: 4',
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    'Tổng số bài tập: 16',
                                  )
                                ],
                              ),
                              Text('09/02/2024')
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: AppDimens.dimens_72,
            )
          ],
        ),
      ),
    ));
  }
}
