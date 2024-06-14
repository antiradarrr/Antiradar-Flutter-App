import 'package:antiradar/src/feature/antiradar/domain/entity/location_entity.dart';

base class CameraLocationEntity extends LocationEntity {
  CameraLocationEntity({
    required super.longitude,
    required super.latitude,
    required this.speedLimit,
  });

  final int speedLimit;
}
