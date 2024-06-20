import 'package:antiradar/src/core/domain/dto/incident_dto.dart';

/// {@template incident_reporting_repository}
/// IncidentReportingRepository.
/// {@endtemplate}
abstract interface class IncidentReportingRepository {
  /// {@macro incident_reporting_repository}

  Future<void> reportIncident(final IncidentDto incidentDto);
}
