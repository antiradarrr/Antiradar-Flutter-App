import 'package:antiradar/src/feature/antiradar/data/model/camera_position_model.dart';
import 'package:antiradar/src/feature/antiradar/data/model/location_model.dart';

/// {@template location_mapper}
/// LocationMapper.
/// {@endtemplate}
base class LocationMapper {
  /// {@macro location_mapper}

  static LocationModel mapper(CameraPositionModel cameraPositionModel) {
    return LocationModel(
        latitude: double.parse(cameraPositionModel.latitude),
        longitude: double.parse(
          cameraPositionModel.longitude,
        ),
        speedLimit: cameraPositionModel.speedLimit);
  }
}
