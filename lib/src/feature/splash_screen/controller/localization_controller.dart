import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template localization_controller}
/// LocalizationController.
/// {@endtemplate}
final class LocalizationController {
  /// {@macro localization_controller}

  LocalizationController({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  Future<void> setLocale(String langCode) async {
    try {
      await _sharedPreferences.setString('langCode', langCode);
    } on Object catch (err, stack) {
      logger.e('SetLocale message', error: err, stackTrace: stack);

      Error.throwWithStackTrace(err, stack);
    }
  }

  Future<String> getLangCode() async {
    try {
      return _sharedPreferences.getString('langCode') ?? 'en';
    } on Object catch (err, stack) {
      logger.e('[LocalizationController] getLocale',
          error: err, stackTrace: stack);

      return 'en';
    }
  }
}
