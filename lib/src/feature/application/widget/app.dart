import 'package:antiradar/src/feature/application/navigation/router/routes.dart';
import 'package:antiradar/src/feature/splash_screen/wrappers/localization_wrapper.dart';
import 'package:antiradar/src/feature/splash_screen/wrappers/theme_wrapper.dart';
import 'package:antiradar/src/uikit/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template app}
/// Application widget.
/// {@endtemplate}
class Application extends StatelessWidget {
  /// {@macro app}
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: LocalizationScope.of(context).locale,
      themeMode: ThemeScope.of(context).themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
