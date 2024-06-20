// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// {@template camera_entity}
/// CameraEntity.
/// {@endtemplate}
base class CameraEntity {
  /// {@macro camera_entity}
  CameraEntity({
    required this.speedLimit,
    required this.latitude,
    required this.longitude,
    required this.complaints,
    required this.reportTime,
  });

  final int speedLimit;
  final double latitude;
  final double longitude;
  final int complaints;
  final DateTime reportTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speedLimit': speedLimit,
      'latitude': latitude,
      'longitude': longitude,
      'complaints': complaints,
      'reportTime': reportTime.millisecondsSinceEpoch,
    };
  }

  factory CameraEntity.fromMap(Map<String, dynamic> map) {
    return CameraEntity(
      speedLimit: map['speedLimit'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      complaints: map['complaints'] as int,
      reportTime: DateTime.fromMillisecondsSinceEpoch(map['reportTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CameraEntity.fromJson(String source) =>
      CameraEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''
    [CameraEntity] => (speedLimit: $speedLimit, 
    latitude: $latitude, 
    longitude: $longitude, 
    complaints: $complaints,
    reportTime: $reportTime)''';
  }
}
