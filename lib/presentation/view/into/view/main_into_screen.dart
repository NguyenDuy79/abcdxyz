import 'package:fitness_and_nutrition/presentation/view/into/view/pages/ratio_nutrition.dart';
import 'package:fitness_and_nutrition/presentation/view/into/view/pages/traning_day_screen.dart';
import 'package:flutter/material.dart';

import 'pages/age_screen.dart';
import 'pages/body_fat_screen.dart';
import 'pages/gender_screen.dart';
import 'pages/goal_screen.dart';
import 'pages/height_screen.dart';
import 'pages/start_screen.dart';

import 'pages/weight_sceen.dart';

// ignore: must_be_immutable
class MainSetupScreen extends StatelessWidget {
  MainSetupScreen({super.key});

  final PageController controller = PageController(keepPage: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          itemBuilder: (context, index) {
            return listPages(controller)[index];
          },
        ),
      ),
    );
  }
}

List<Widget> listPages(PageController controller) {
  return [
    StartScreen(controller),
    GenderScreen(controller),
    MainGoalScreen(controller),
    BodyFatWidget(controller),
    ChooseAgeScreen(controller),
    ChooseHeightWidget(controller),
    ChooseWeightWidget(controller),
    ChoooseTrainingDay(controller),
    RatioNutrition(controller)
    //FitnessTrainingExperience(controller)
  ];
}
