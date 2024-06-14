import 'package:antiradar/src/feature/antiradar/data/data_sources/local_storage/camera_local_data_sources.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/camera_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/repositories/camera_local_repository.dart';

base class CameraLocalRepositoryImpl
    implements CameraLocalRepository {
  CameraLocalRepositoryImpl({required this.cameraLocalDataSources});

  final ICameraLocalDataSources cameraLocalDataSources;

  @override
  Future<List<CameraLocationEntity>> fetchCameraLocation() async {
    return await cameraLocalDataSources.fetchCameraList();
  }
}
