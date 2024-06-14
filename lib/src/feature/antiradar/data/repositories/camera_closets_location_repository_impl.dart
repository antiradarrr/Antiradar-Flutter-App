import 'package:antiradar/src/feature/antiradar/data/data_sources/closets_location_data_sources.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/camera_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/user_position.dart';
import 'package:antiradar/src/feature/antiradar/domain/repositories/closets_location_repository.dart';

base class CameraClosetsLocationRepositoryImpl
    implements IClosetsLocationRepository<CameraLocationEntity, UserPosition> {
  CameraClosetsLocationRepositoryImpl(
      {required this.cameraClosetsLocationDataSources});

  final IClosetsLocationDataSources cameraClosetsLocationDataSources;

  @override
  Future<NearestLocationEntity> fetchClosetsLocation(
      List<CameraLocationEntity> locationList, String langCode) async {
    return await cameraClosetsLocationDataSources.fetchClosetsLocation(
        locationList, langCode);
  }
}
