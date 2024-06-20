part of 'incident_reporting_bloc.dart';

sealed class IncidentReportingState extends Equatable {
  const IncidentReportingState();
  
  @override
  List<Object> get props => [];
}

final class IncidentReportingInitial extends IncidentReportingState {}
