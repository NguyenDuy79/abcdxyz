import 'package:flutter/material.dart';

import '../../core/resource/app_colors.dart';
import '../../core/resource/app_fonts.dart';

final ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    //scaffoldBackgroundColor: ,
    fontFamily: AppFont.popins,
    colorScheme: const ColorScheme.light(
        background: AppColor.white,
        primary: AppColor.white,
        secondary: AppColor.pink));
