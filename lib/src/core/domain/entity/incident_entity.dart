// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// {@template incident_entity}
/// IncidentEntity.
/// {@endtemplate}
base class IncidentEntity {
  /// {@macro incident_entity}
  IncidentEntity({
    required this.incident,
    required this.latitude,
    required this.longitude,
    required this.reportingDate,
  });

  final String incident;
  final double latitude;
  final double longitude;
  final DateTime reportingDate;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'incident': incident,
      'latitude': latitude,
      'longitude': longitude,
      'reportingDate': reportingDate.millisecondsSinceEpoch,
    };
  }

  factory IncidentEntity.fromMap(Map<String, dynamic> map) {
    return IncidentEntity(
      incident: map['incident'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      reportingDate:
          DateTime.fromMillisecondsSinceEpoch(map['reportingDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory IncidentEntity.fromJson(String source) =>
      IncidentEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'IncidentEntity(incident: $incident, latitude: $latitude, longitude: $longitude, reportingDate: $reportingDate)';
  }
}
