import 'package:antiradar/src/feature/antiradar/data/model/location_model.dart';
import 'package:geolocator/geolocator.dart';

/// {@template driwe_repository}
/// IDriweRepository.
/// {@endtemplate}
abstract interface class IDriweRepository {
  /// {@macro driwe_repository}

  LocationModel findClosestGeoLocation(
      List<LocationModel> locationModelList, LocationModel userLocation);
  // double calculateDistance(LocationModel location1, LocationModel location2);
  // double degreesToRadians(double degrees);
  Stream<Position> getPositionSteam();
  // double distanceMeters(LocationModel closetsLocation, Position userPosition);
}
