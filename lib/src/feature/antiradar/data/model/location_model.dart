import 'package:flutter/foundation.dart';

/// {@template location_model}
/// LocationModel.
/// {@endtemplate}
@immutable
base class LocationModel {
  /// {@macro location_model}
  const LocationModel({required this.latitude, required this.longitude, required this.speedLimit});
  final double latitude;
  final double longitude;
  final String speedLimit;
}
