import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/route/route_generator.dart';
import '../config/theme/app_theme.dart';
import '../presentation/bloc/common_bloc.dart';

enum Reload { yes, no }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    CommonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CommonBloc.blocProvider,
      child: MaterialApp(
        builder: (context, child) {
          print('dụ a');
          return MediaQuery(
            // ignore: deprecated_member_use
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        title: 'Fitness Demo',
        theme: lightThemeData,
        initialRoute: RouteGenerator.splashScreen,
        onGenerateRoute: RouteGenerator.generatorRoute,
      ),
    );
  }
}
