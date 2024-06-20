import 'package:antiradar/src/core/dependencies/dependencies.dart';
import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/application/widget/root_application.dart';
import 'package:antiradar/src/feature/initialization/config/supabase_config/supabase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template runner}
/// Runner.
/// {@endtemplate}
abstract final class Runner {
  /// {@macro runner}

  static Future<void> launch() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
      url: SupabaseConf.url,
      anonKey: SupabaseConf.anonKey,
    );

    /// Create dependencies instance.
    final dependencies = Dependencies();

    /// Initialize depedencies.
    await dependencies.initialize();

    FlutterError.onError = (details) {
      logger.e('Flutter error',
          error: details.exception, stackTrace: details.stack);
    };

    PlatformDispatcher.instance.onError = (err, stack) {
      logger.e('Platform dispatcher', error: err, stackTrace: stack);
      return true;
    };

    runApp(RootApplication(dependencies: dependencies));
  }
}
