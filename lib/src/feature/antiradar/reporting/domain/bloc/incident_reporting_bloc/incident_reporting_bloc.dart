import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'incident_reporting_event.dart';
part 'incident_reporting_state.dart';

class IncidentReportingBloc
    extends Bloc<IncidentReportingEvent, IncidentReportingState> {
  IncidentReportingBloc() : super(IncidentReportingInitial()) {
    on<IncidentReportingEvent>((event, emit) {});
  }
}
