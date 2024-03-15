import 'package:fitness_and_nutrition/core/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route/route_generator.dart';
import '../../../bloc/infotion_cubit/infomation_cubit.dart';
import '../bloc/splash_cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) async {
      print('3');
      if (state is SplashLoaded) {
        if (state.data) {
          print('1');
          Navigator.pushReplacementNamed(context, RouteGenerator.mainScreen);
        } else {
          print('2');
          try {
            Navigator.pushNamed(context, RouteGenerator.firstScreen);
            print('212');
          } catch (err) {
            print(err.toString());
          }
        }
      }
    }, builder: (context, state) {
      print('quá hề');

      return Scaffold(
        body: const Text(
          'ádadsadada',
          style: TextStyle(color: AppColor.black),
        ),
      );
    });
  }
}
