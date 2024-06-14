import 'package:antiradar/src/feature/antiradar/domain/entity/user_position.dart';
import 'package:geolocator/geolocator.dart';

base class PositionMapper {
  static UserPosition of(Position position) {
    return UserPosition(
        longitude: position.longitude, latitude: position.longitude);
  }
}
