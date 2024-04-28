import 'package:antiradar/src/uikit/colors/color_palette.dart';
import 'package:flutter/material.dart';

/// {@template app_color_scheme}
/// AppColorScheme.
/// {@endtemplate}
@immutable
base class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// {@macro app_color_scheme}

  /// The color of the button on [primary].
  final Color primary;

  /// The color of the text on [primary].
  final Color onPrimary;

  /// Background color.
  ///
  /// The color of
  final Color background;

  /// On background color.
  final Color onBackground;

  final Color surface;
  

  /// base dark theme
  const AppColorScheme.light()
      : onPrimary = ColorPalette.dark,
        primary = ColorPalette.blue,
        background = ColorPalette.white,
        onBackground = ColorPalette.dark,
        surface = ColorPalette.shadeGrey;

  /// base light theme
  const AppColorScheme.dark()
      : onPrimary = ColorPalette.white,
        primary = ColorPalette.blue,
        background = ColorPalette.white,
        onBackground = ColorPalette.dark,
        surface = ColorPalette.blackBlue;

  const AppColorScheme._({
    required this.onPrimary,
    required this.primary,
    required this.background,
    required this.onBackground,
    required this.surface,
  });
  @override
  ThemeExtension<AppColorScheme> copyWith(
      {Color? primary,
      Color? onPrimary,
      Color? background,
      Color? onBackground,
      Color? surface}) {
    return AppColorScheme._(
        onPrimary: onPrimary ?? this.onPrimary,
        primary: primary ?? this.primary,
        background: background ?? this.background,
        onBackground: onBackground ?? this.onBackground,
        surface: surface ?? this.surface);
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
      covariant ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
        onPrimary: onPrimary,
        primary: primary,
        background: background,
        onBackground: onBackground,
        surface: surface);
  }
}
