import 'package:fitness_and_nutrition/presentation/bloc/nutri_cubit/nutri_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utility/injector.dart';
import 'infotion_cubit/infomation_cubit.dart';
import 'water_cubit/water_cubit.dart';

class CommonBloc {
  CommonBloc._();
  static final List<BlocProvider> blocProvider = [
    BlocProvider<InfomationCubit>(
        create: (context) => injector<InfomationCubit>()),
    // BlocProvider<NutriCubit>(create: (context) => injector<NutriCubit>()),
    // BlocProvider<WaterCubit>(create: (context) => injector<WaterCubit>())
  ];
  static void dispose() {
    injector<InfomationCubit>().close();
    injector<NutriCubit>().close();
    injector<WaterCubit>().close();
  }
}
