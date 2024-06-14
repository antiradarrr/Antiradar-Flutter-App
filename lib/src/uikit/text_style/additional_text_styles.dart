import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AdditionalTextStyles {
  /// Style for setting.
  TextStyle get listTileStyle;
}

final class _DarkStyle extends AdditionalTextStyles {
  @override
  TextStyle get listTileStyle => GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white);
}

final class _LightStyle extends AdditionalTextStyles {
  @override
  TextStyle get listTileStyle => GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black);
}

/// Provide [AdditionalTextStyles] for app.
abstract base class StyleProvider {
  /// Additional [TextStyle] configuration.
  static AdditionalTextStyles of(ThemeMode theme) {
    if (theme == ThemeMode.light) return _lightTextStyle;

    return _darkTextStyle;
  }

  /// Additional light text styles.
  static final _lightTextStyle = _LightStyle();

  /// Additional dark text styles.
  static final _darkTextStyle = _DarkStyle();
}

late final String name, userName;
