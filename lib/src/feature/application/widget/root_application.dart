import 'package:antiradar/src/core/dependencies/dependencies.dart';
import 'package:antiradar/src/feature/application/widget/app.dart';
import 'package:antiradar/src/feature/splash_screen/wrappers/localization_wrapper.dart';
import 'package:antiradar/src/feature/splash_screen/wrappers/theme_wrapper.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// {@template root_application}
/// RootApplication widget.
/// {@endtemplate}
class RootApplication extends StatelessWidget {
  /// {@macro root_application}
  const RootApplication({super.key, required this.dependencies});

  final Dependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: dependencies,
      child: LocalizationWrapper(
        child: ThemeWrapper(
          child: Builder(builder: (context) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: const Application(),
            );
          }),
        ),
      ),
    );
  }
}
