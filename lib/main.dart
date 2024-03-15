import 'package:fitness_and_nutrition/core/app.dart';
import 'package:fitness_and_nutrition/core/utility/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}
