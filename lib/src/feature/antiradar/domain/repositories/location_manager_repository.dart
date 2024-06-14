import 'package:antiradar/src/feature/antiradar/domain/entity/location_entity.dart';

abstract interface class ILocationManagerRepository<E extends LocationEntity> {
  Future<List<E>> fetchLocationList();
}
