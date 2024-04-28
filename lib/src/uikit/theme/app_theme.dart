import 'package:antiradar/src/uikit/colors/app_color_scheme.dart';
import 'package:antiradar/src/uikit/colors/color_palette.dart';
import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';

/// {@template app_theme}
/// AppTheme.
/// {@endtemplate}
abstract base class AppTheme {
  /// {@macro app_theme}

  /// Light theme configuration.
  static final ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: _lightColorScheme.primary,
        onPrimary: _lightColorScheme.onPrimary,
        secondary: Colors.black,
        onSecondary: Colors.black,
        error: Colors.white,
        onError: Colors.white,
        background: _lightColorScheme.background,
        onBackground: _lightColorScheme.onBackground,

        /// Response card container color.
        surface: _lightColorScheme.surface,

        /// Response text color on widget.
        onSurface: Colors.black,
      ),
      listTileTheme: ListTileThemeData(titleTextStyle: AppTextStyles.body),
      textTheme: TextTheme(
          bodyLarge: AppTextStyles.buttonStyle,
          titleMedium: AppTextStyles.darkThemeButtonStyle,
          titleSmall: AppTextStyles.smallLightTextStyle),
      appBarTheme: const AppBarTheme(backgroundColor: ColorPalette.blue));

  /// Dark theme configuration.
  static final ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: _darkColorScheme.primary,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          background: _darkColorScheme.background,
          onBackground: _darkColorScheme.onBackground,
          surface: _darkColorScheme.surface,
          onSurface: Colors.white),
      listTileTheme: ListTileThemeData(titleTextStyle: AppTextStyles.body),
      textTheme: TextTheme(
          bodyLarge: AppTextStyles.buttonStyle,
          titleMedium: AppTextStyles.darkThemeButtonStyle,
          titleSmall: AppTextStyles.smallDarkTextStyle),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff000000)));

  /// Base color scheme.
  static const _lightColorScheme = AppColorScheme.light();

  /// Base dark color scheme.
  static const _darkColorScheme = AppColorScheme.dark();
}
