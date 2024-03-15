import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_another.dart';
import '../../../../core/resource/app_colors.dart';
import '../../../../core/resource/app_dimens.dart';
import '../../../../data/source/local/pref/pref_local.dart';
import '../../../../domain/entity/food.dart';
import '../../../widget/global/bottom_navigation_bar.dart';
import '../../../widget/global/meal_ingredients.dart';
import '../../../widget/global/text_field.dart';
import '../bloc/set_weight/set_weight_cubit.dart';

class ModalPopupWidget extends StatelessWidget {
  const ModalPopupWidget(this.current, {super.key});

  final int current;

  @override
  Widget build(BuildContext context) {
    final Food food = AppAnother.listFood[current];
    // print(food);
    // final double width = MediaQuery.of(context).size.width;
    return BlocProvider<SetWeightCubit>(
      create: (context) => SetWeightCubit(),
      child: CupertinoPopupSurface(
        child: Container(
          color: AppColor.grey1,
          height: AppDimens.dimens_300,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.dimens_16, vertical: AppDimens.dimens_16),
          child: Scaffold(
            body: BlocBuilder<SetWeightCubit, SetWeightState>(
              builder: (context, state) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldWidget((value) {
                        context.read<SetWeightCubit>().onChangeValue(value);
                      }, '100 gram', TextInputType.number, const SizedBox(),
                          true),
                      if (state.errorText != '')
                        Text(
                          state.errorText,
                          style: const TextStyle(color: AppColor.red),
                        ),
                      Container(
                        height: AppDimens.dimens_105,
                        width: double.infinity,
                        alignment: Alignment.center,
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
                            Expanded(
                                child: MealIngredientsWidget(
                                    calories:
                                        ((state.weight / 100) * food.calories),
                                    protein:
                                        ((state.weight / 100) * food.protein),
                                    carb: ((state.weight / 100) * food.carb),
                                    fat: ((state.weight / 100) * food.fat)))
                          ],
                        ),
                      ),
                      BottomNavigationBarWidget(() async {
                        await PrefLocal()
                            .setDouble('weight', state.weight)
                            .then((value) async {
                          await PrefLocal().setInt('position', current);
                        }).then((value) {
                          Navigator.of(context).pop();
                        });
                      }, state.errorText == '')
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
