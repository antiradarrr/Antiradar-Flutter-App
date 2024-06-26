import 'package:antiradar/src/core/utils/helpers/audio_player_helper.dart';
import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:flutter/foundation.dart';

extension EnumComparator<T extends Enum> on T {
  bool compare(T other) {
    if (index == other.index) {
      logger.i("Elemeents compared $other}");

      return true;
    }
    logger.i("Elemeents not compared");
    return false;
  }
}
