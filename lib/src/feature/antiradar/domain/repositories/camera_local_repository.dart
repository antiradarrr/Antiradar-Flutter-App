import '../entity/camera_location_entity.dart';

abstract interface class CameraLocalRepository {
  Future<List<CameraLocationEntity>> fetchCameraLocation();
}
