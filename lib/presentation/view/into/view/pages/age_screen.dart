import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class ChooseAgeScreen extends StatelessWidget {
  const ChooseAgeScreen(this.controller, {super.key});
  final PageController controller;

  @override
  @override
  Widget build(BuildContext context) {
    final DateTime date =
        DateTime.now().subtract(Duration(days: (365.25 * 8).toInt()));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.dimens_12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
              child: IconButton(
                  onPressed: () {
                    controller.animateToPage(3,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
              child: Center(
                child: Text(
                  'Ngày sinh của bạn là gì ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppDimens.dimens_24,
                      fontWeight: AppFont.semiBold),
                ),
              ),
            ),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.dimens_16),
                child: SizedBox(
                  height: AppDimens.dimens_200,
                  // width: sizeScreen.width * 0.9,
                  child: BlocBuilder<InfomationBodyDartCubit,
                      InfomationBodyDartState>(
                    builder: (context, state) {
                      return CupertinoDatePicker(
                        initialDateTime: state.dateOfBirth == ''
                            ? date
                            : DateTime.parse(
                                state.dateOfBirth.replaceAll('/', '')),
                        maximumDate: DateTime.now()
                            .subtract(Duration(days: (365.25 * 8).toInt())),
                        minimumDate: DateTime.now()
                            .subtract(Duration(days: (365.25 * 80).toInt())),
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        showDayOfWeek: true,
                        // This is called when the user changes the time.
                        onDateTimeChanged: (DateTime newTime) {
                          context
                              .read<InfomationBodyDartCubit>()
                              .setDateOfBirth(newTime);
                        },
                      );
                    },
                  ),
                )),
            const SizedBox(
              height: AppDimens.dimens_16,
            ),
            BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.dateOfBirth == ''
                        ? DateFormat('dd/MM/yyyy').format(date)
                        : DateFormat('dd/MM/yyyy').format(DateTime.parse(
                            state.dateOfBirth.replaceAll('/', ''))),
                    style: const TextStyle(
                        fontSize: AppDimens.dimens_20,
                        fontWeight: AppFont.medium,
                        color: AppColor.pink),
                  ),
                );
              },
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            right: AppDimens.dimens_24,
            left: AppDimens.dimens_24,
            bottom: AppDimens.dimens_12),
        child: BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (state.dateOfBirth == '') {
                  context.read<InfomationBodyDartCubit>().setDateOfBirth(date);
                }
                controller.animateToPage(5,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
              child: Container(
                height: AppDimens.dimens_45,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.pink.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(AppDimens.dimens_16)),
                child: const Text(
                  'Tiếp theo',
                  style: TextStyle(
                      fontSize: AppDimens.dimens_28,
                      fontWeight: AppFont.semiBold,
                      color: AppColor.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
