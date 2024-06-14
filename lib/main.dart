import 'dart:async';

import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/initialization/runner/runner.dart';

void main() => runZonedGuarded(
      () {
        Runner.launch();
      },
      (error, stack) {
        logger.e('GLOBAL EXCEPTION', error: error, stackTrace: stack);
      },
    );
