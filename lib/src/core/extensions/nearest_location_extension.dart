import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/enums/speed_limits_status.dart';

extension NearestLocationExtension on NearestLocationEntity {
  SpeedLimitStatus status() {
    return switch (distanceInMeters) {
      >= 800 && > 500 => SpeedLimitStatus.eightHundred,
      >= 500 && > 300 => SpeedLimitStatus.fiveHundred,
      >= 300 && > 0 => SpeedLimitStatus.threeHundred,
      _ => SpeedLimitStatus.empty,
    };
  }
}
