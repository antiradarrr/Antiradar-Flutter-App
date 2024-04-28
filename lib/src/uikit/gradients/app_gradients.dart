import 'package:antiradar/src/feature/splash_screen/wrappers/theme_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

/// {@template app_gradients}
/// AppGradient.
/// {@endtemplate}
abstract final class AppGradient {
  /// {@macro app_gradients}

  static const LinearGradient blue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff377EF6),
      Color(0xff2F6BD1),
      Color(0xff2461C9),
      Color(0xff255AB4),
      Color(0xff204A90),
    ],
  );

  static Gradient themeBackgroundGradient(BuildContext context) {
    if (ThemeScope.of(context).themeMode == ThemeMode.dark) {
      return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff000000),
            Color(0xff021333),
          ]);
    }

    return AppGradient.blue;
  }


  
}
