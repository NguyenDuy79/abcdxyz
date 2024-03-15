import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utility/injector.dart';
import '../../presentation/view/first/first_cubit.dart';
import '../../presentation/view/first/first_screen.dart';
import '../../presentation/view/into/bloc/cubit/infomation_body_dart_cubit.dart';
import '../../presentation/view/into/view/main_into_screen.dart';
import '../../presentation/view/main/bloc/main_page_cubit/main_page_index_cubit.dart';
import '../../presentation/view/main/bloc/nutrition_screen/nutrition_screen_cubit_cubit.dart';
import '../../presentation/view/main/screen/activity_screen.dart';
import '../../presentation/view/main/screen/home_screen.dart';
import '../../presentation/view/main/screen/main_screen.dart';
import '../../presentation/view/main/screen/more_creen.dart';
import '../../presentation/view/main/screen/nutrition_screen.dart';
import '../../presentation/view/main/screen/plan_screen.dart';
import '../../presentation/view/splash/bloc/splash_cubit/splash_cubit.dart';
import '../../presentation/view/splash/view/splash_screen.dart';

class RouteGenerator {
  RouteGenerator._();
  static const mainScreen = '/main-screen';
  static const splashScreen = '/splash-screen';
  static const intoScreen = '/into-screen';
  static const setupScreen = 'setup-screen';
  static const firstScreen = '/first-screen';
  static const mealScreen = '/meal_sceen';
  static const List<Widget> listPage = [
    HomeScreen(),
    NutritionScreen(),
    ActivityScreen(),
    PlanScreen(),
    MoreScreen()
  ];
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<SplashCubit>(
                  create: (context) =>
                      SplashCubit(getAllDataUseCase: injector()),
                  child: const SplashScreen(),
                ));
      case firstScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<FirstCubit>(
                  create: (context) => FirstCubit(),
                  child: const FirstScreen(),
                ));
      case setupScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<InfomationBodyDartCubit>(
                  create: (context) => injector<InfomationBodyDartCubit>(),
                  child: MainSetupScreen(),
                ));
      case mainScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider<MainPageIndexCubit>(
                      create: (context) => MainPageIndexCubit(),
                    ),
                    BlocProvider<NutritionScreenCubitCubit>(
                      create: (context) => NutritionScreenCubitCubit(),
                    ),
                  ],
                  child: const MainScreen(),
                ));
      // case mealScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider<MealCubit>(
      //             create: (context) => injector<MealCubit>(),
      //             child: const MealScreen(),
      //           ));
      default:
        return _exceptionRoute();
    }
  }

  static Route<dynamic> _exceptionRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: const Center(
                child: Text('ERROR'),
              ),
            ));
  }
}
