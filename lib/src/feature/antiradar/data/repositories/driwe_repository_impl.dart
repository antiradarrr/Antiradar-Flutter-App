import 'package:antiradar/src/feature/antiradar/data/data_souces/driwe_data_sources.dart';
import 'package:antiradar/src/feature/antiradar/data/model/location_model.dart';
import 'package:antiradar/src/feature/antiradar/domain/repositories/driwe_repository.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

/// {@template driwe_repository_impl}
/// DriweRepositoryImpl.
/// {@endtemplate}
base class DriweRepositoryImpl implements IDriweRepository {
  /// {@macro driwe_repository_impl}
  DriweRepositoryImpl({required this.driweDataSources});

  final IDriweDataSources driweDataSources;


  @override
  LocationModel findClosestGeoLocation(
      List<LocationModel> locationModelList, LocationModel userLocation) {
    return driweDataSources.findClosestGeoLocation(
        locationModelList, userLocation);
  }

  @override
  Stream<Position> getPositionSteam() async* {
    yield* driweDataSources.getPositionSteam();
  }
  

}
