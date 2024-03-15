import 'package:flutter/material.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.controller, {super.key});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.dimens_12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xin chào!',
                  style: TextStyle(
                      fontWeight: AppFont.semiBold,
                      fontSize: AppDimens.dimens_28),
                ),
                SizedBox(
                  height: AppDimens.dimens_5,
                ),
                Text(
                  'Trước tiên để hỗ trợ bạn được tốt nhất chúng tôi có vài câu hỏi cho bạn',
                  style: TextStyle(fontSize: AppDimens.dimens_16),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.animateToPage(1,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
              child: Center(
                child: Container(
                  height: AppDimens.dimens_45,
                  width: size.width - AppDimens.dimens_24 * 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.pink.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
                  child: const Text(
                    'Sẵn sàng',
                    style: TextStyle(
                        fontSize: AppDimens.dimens_28,
                        fontWeight: AppFont.semiBold,
                        color: AppColor.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
