import 'dart:math';

import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/antiradar/data/model/location_model.dart';
import 'package:geolocator/geolocator.dart';

/// {@template driwe_data_sources}
/// IDriweDataSources.
/// {@endtemplate}
abstract interface class IDriweDataSources {
  /// {@macro driwe_data_sources}

  LocationModel findClosestGeoLocation(
      List<LocationModel> locationModelList, LocationModel userLocation);
  double calculateDistance(LocationModel location1, LocationModel location2);
  double degreesToRadians(double degrees);
  Stream<Position> getPositionSteam();

  double distanceMeters(
      LocationModel closetsLocation, LocationModel userPosition);
}

/// {@template driwe_data_sources}
/// DriweDataSources.
/// {@endtemplate}
base class DriweDataSources implements IDriweDataSources {
  /// {@macro driwe_data_sources}

  @override
  double calculateDistance(LocationModel location1, LocationModel location2) {
    const double earthRadiusKm = 6371.0;

    double dLat = degreesToRadians(location2.latitude - location1.latitude);
    double dLon = degreesToRadians(location2.longitude - location1.longitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(degreesToRadians(location1.latitude)) *
            cos(degreesToRadians(location2.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadiusKm * c;
  }

  @override
  LocationModel findClosestGeoLocation(
      List<LocationModel> locationModelList, LocationModel userLocation) {
    Stopwatch stopwatch = Stopwatch()..start();

    double minDistance = double.infinity;
    late LocationModel closestLocation;

    for (var location in locationModelList) {
      double distance = calculateDistance(userLocation, location);

      if (distance < minDistance) {
        minDistance = distance;
        closestLocation = location;
      }
    }

    stopwatch.stop();

    return LocationModel(
        latitude: closestLocation.latitude,
        longitude: closestLocation.longitude,
        speedLimit: closestLocation.speedLimit);
  }

  @override
  double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  @override
  Stream<Position> getPositionSteam() async* {
    yield* Geolocator.getPositionStream();
  }

  @override
  double distanceMeters(
      LocationModel closetsLocation, LocationModel userPosition) {
    return Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        closetsLocation.latitude,
        closetsLocation.longitude);
  }

  void getClosetsLocation(
      List<LocationModel> locationModelList, LocationModel userPosition) {
    print('run');
    for (var position in locationModelList) {
      final data = Geolocator.distanceBetween(userPosition.latitude,
          userPosition.longitude, position.latitude, position.longitude);

      if (data < 900) {
        print('location compare $data');
      } else {
        print('compater location not found');
      }
    }
  }
}
