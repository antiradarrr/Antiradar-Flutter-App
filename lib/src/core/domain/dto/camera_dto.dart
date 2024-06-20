/// {@template camera_dto}
/// CameraDto.
/// {@endtemplate}
final class CameraDto {
  /// {@macro camera_dto}
  CameraDto({
    required this.country,
    required this.time,
  });

  final String country;
  final DateTime time;
}
