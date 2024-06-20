import 'package:antiradar/src/core/domain/dto/camera_dto.dart';

/// {@template camera_reporting_repository}
/// ICameraReportingRepository.
/// {@endtemplate}
abstract interface class ICameraReportingRepository {
  /// {@macro camera_reporting_repository}

  Future<void> reportCamera(final CameraDto cameraDto);
}
