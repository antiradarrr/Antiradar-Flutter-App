import 'package:antiradar/src/feature/splash_screen/wrappers/theme_wrapper.dart';
import 'package:antiradar/src/uikit/colors/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template app_text_styles}
/// AppTextStyles.
/// {@endtemplate}
abstract base class AppTextStyles {
  /// {@macro app_text_styles}

  static const header = TextStyle(
      fontFamily: 'SFPro',
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: Colors.white);

  static final body = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

  static const buttonStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'SFPro',
    fontStyle: FontStyle.normal,
    color: ColorPalette.blue,
  );

  static const kButtonStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
      fontStyle: FontStyle.normal,
      color: ColorPalette.white,
      height: 0);
  static const addButtonStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
      fontStyle: FontStyle.normal,
      color: ColorPalette.blue,
      height: 0);

  static const speedTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontFamily: 'SFPro',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);

  static const headerStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
      color: Colors.white);

  static final darkThemeButtonStyle = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.blue);
  static final lightThemeButtonStyle = GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: const Color(0xff878787));

  static TextStyle darkButtonProvider(BuildContext context) {
    if (ThemeScope.of(context).themeMode == ThemeMode.dark) {
      return darkThemeButtonStyle;
    }
    return lightThemeButtonStyle;
  }

  static TextStyle lightButtonProvider(BuildContext context) {
    if (ThemeScope.of(context).themeMode == ThemeMode.dark) {
      return lightThemeButtonStyle;
    }
    return darkThemeButtonStyle;
  }

  static const distanceTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'SFPro',
      color: Color(0xff858585));

  static const smallLightTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      fontFamily: "SFPro",
      height: 0);
  static const smallDarkTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      fontFamily: "SFPro",
      height: 0);

  static final lightLabelLarge = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Colors.white,
  );
  static final darkLabelLarge = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Colors.black,
  );
}
