import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/app_colors.dart';
import '../../../../../core/resource/app_dimens.dart';
import '../../../../../core/resource/app_fonts.dart';
import '../../../../../core/resource/app_string.dart';
import '../../bloc/cubit/infomation_body_dart_cubit.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen(this.controller, {super.key});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    // context.read<InfomationBodyDartCubit>().setHeightAndWidth(
    //     (sizeScreen.width / 2 - AppDimens.dimens_16) * 1.5,
    //     (sizeScreen.width / 2 - AppDimens.dimens_16));
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
                      controller.animateToPage(0,
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
                    'Giới tính sinh học của bạn là gì ?',
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
                    const EdgeInsets.symmetric(horizontal: AppDimens.dimens_8),
                child: BlocBuilder<InfomationBodyDartCubit,
                    InfomationBodyDartState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await context
                                .read<InfomationBodyDartCubit>()
                                .setGender(AppString.male);
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              if (state.gender == '') {
                                controller.animateToPage(2,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.linear);
                              }
                            });
                          },
                          child: AnimatedContainer(
                            width: (sizeScreen.width / 2 - AppDimens.dimens_16),
                            height:
                                (sizeScreen.width / 2 - AppDimens.dimens_16) *
                                    1.5,
                            duration: const Duration(milliseconds: 250),
                            padding: EdgeInsets.all(
                                state.gender == AppString.male
                                    ? state.heightWidget
                                    : 0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.dimens_8,
                                  vertical: AppDimens.dimens_16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: AppDimens.dimens_1,
                                      color: state.gender == AppString.male
                                          ? AppColor.white
                                          : AppColor.pink.withOpacity(0.5)),
                                  color: state.gender == AppString.male
                                      ? AppColor.pink
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.dimens_24)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.male,
                                      size: (sizeScreen.width / 2 -
                                          AppDimens.dimens_16 -
                                          AppDimens.dimens_36),
                                      color: state.gender == AppString.male
                                          ? AppColor.white
                                          : AppColor.pink,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: AppDimens.dimens_16,
                                  ),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_24,
                                        fontWeight: AppFont.semiBold,
                                        color: state.gender == AppString.male
                                            ? AppColor.white
                                            : AppColor.black),
                                  ),
                                  const SizedBox(
                                    height: AppDimens.dimens_16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: AppDimens.dimens_16,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await context
                                .read<InfomationBodyDartCubit>()
                                .setGender(AppString.female);
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              if (state.gender == '') {
                                controller.animateToPage(2,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.linear);
                              }
                            });
                          },
                          child: AnimatedContainer(
                            width: (sizeScreen.width / 2 - AppDimens.dimens_16),
                            height:
                                (sizeScreen.width / 2 - AppDimens.dimens_16) *
                                    1.5,
                            duration: const Duration(milliseconds: 250),
                            padding: EdgeInsets.all(
                                state.gender == AppString.female
                                    ? state.heightWidget
                                    : 0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.dimens_8,
                                  vertical: AppDimens.dimens_16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: AppDimens.dimens_1,
                                      color: state.gender == AppString.female
                                          ? AppColor.white
                                          : AppColor.pink.withOpacity(0.5)),
                                  color: state.gender == AppString.female
                                      ? AppColor.pink
                                      : AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.dimens_24)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.female,
                                    size: (sizeScreen.width / 2 -
                                        AppDimens.dimens_16 -
                                        AppDimens.dimens_36),
                                    color: state.gender == AppString.female
                                        ? AppColor.white
                                        : AppColor.pink,
                                  ),
                                  const SizedBox(
                                    height: AppDimens.dimens_16,
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                        fontSize: AppDimens.dimens_24,
                                        fontWeight: AppFont.semiBold,
                                        color: state.gender == AppString.female
                                            ? AppColor.white
                                            : AppColor.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<InfomationBodyDartCubit, InfomationBodyDartState>(
                builder: (context, state) {
          return state.gender == ''
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(
                      right: AppDimens.dimens_24,
                      left: AppDimens.dimens_24,
                      bottom: AppDimens.dimens_12),
                  child: GestureDetector(
                    onTap: () {
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    child: Container(
                      height: AppDimens.dimens_45,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.pink.withOpacity(0.8),
                          borderRadius:
                              BorderRadius.circular(AppDimens.dimens_16)),
                      child: const Text(
                        'Tiếp theo',
                        style: TextStyle(
                            fontSize: AppDimens.dimens_28,
                            fontWeight: AppFont.semiBold,
                            color: AppColor.white),
                      ),
                    ),
                  ),
                );
        }));
  }
}
