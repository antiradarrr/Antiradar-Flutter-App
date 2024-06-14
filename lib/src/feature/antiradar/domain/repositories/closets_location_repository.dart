import 'package:antiradar/src/feature/antiradar/domain/entity/location_entity.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';


abstract interface class IClosetsLocationRepository<E extends LocationEntity,
    T extends LocationEntity> {
  Future<NearestLocationEntity> fetchClosetsLocation(
    List<E> locationList,
    String langCode,
  );

// Future<UserPosition> fetchUserLocation();
}
