/// {@template camera_position_model}
/// CameraPositionModel.
/// {@endtemplate}
final class CameraPositionModel {
  /// {@macro camera_position_model}
  CameraPositionModel({
    required this.longitude,
    required this.latitude,
    required this.speedLimit,
  });

  final String longitude;
  final String latitude;
  final String speedLimit;
  
}
