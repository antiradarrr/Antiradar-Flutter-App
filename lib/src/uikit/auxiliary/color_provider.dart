import 'package:antiradar/src/feature/splash_screen/wrappers/theme_wrapper.dart';
import 'package:flutter/material.dart';

base class ColorProvider {
  static Color appBarColor(BuildContext context) {
    if (ThemeScope.of(context).themeMode == ThemeMode.dark) {
      return const Color(0xff000000);
    }
    return const Color(0xff377EF6);
  }

  static Color systemNavigationColor(BuildContext context) {
    if (ThemeScope.of(context).themeMode == ThemeMode.dark) {
      return const Color(0xff021333);
    }
    return const Color(0xff204A90);
  }
}
