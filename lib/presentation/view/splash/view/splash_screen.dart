import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route/route_generator.dart';
import '../../../bloc/infotion_cubit/infomation_cubit.dart';
import '../bloc/splash_cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<InfomationCubit, InfomationState>(
      listener: (context, state) {
        if (state.check != 0) {
          if (state.check == 1) {
            context.read<SplashCubit>().onChangeSplash(false);
          } else {
            context.read<SplashCubit>().onChangeSplash(true);
          }
        }
      },
      child: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) async {
        if (state is SplashLoaded) {
          if (state.data) {
            Navigator.pushReplacementNamed(context, RouteGenerator.mainScreen);
          } else {
            Navigator.pushNamed(context, RouteGenerator.firstScreen);
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: size.height * 0.6,
            width: size.width * 0.6,
            child: Image.asset('assets/images/cbum.png'),
          ),
        );
      }),
    );
  }
}
