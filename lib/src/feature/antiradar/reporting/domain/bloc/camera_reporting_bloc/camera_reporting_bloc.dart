import 'dart:async';

import 'package:antiradar/src/feature/antiradar/reporting/domain/repository/camera_reporting_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'camera_reporting_event.dart';
part 'camera_reporting_state.dart';

/// Business Logic Component CameraReportingBLoC
class CameraReportingBLoC
    extends Bloc<CameraReportingEvent, CameraReportingState>
    implements EventSink<CameraReportingEvent> {
  CameraReportingBLoC({
    required final ICameraReportingRepository repository,
    final CameraReportingState? initialState,
  })  : _repository = repository,
        super(
          initialState ??
              const CameraReportingState.idle(
                data: CameraReportingEntity(),
                message: 'Initial idle state',
              ),
        ) {
    on<CameraReportingEvent>(
      (event, emit) => event.map<Future<void>>(
        fetch: (event) => _fetch(event, emit),
      ),
    );
  }

  final ICameraReportingRepository _repository;

  Future<void> _fetch(_FetchCameraReportingEvent event,
      Emitter<CameraReportingState> emit) async {
    try {
      emit(CameraReportingState.processing(data: state.data));
      // final newData = await _repository.fetch(event.name);
      // emit(CameraReportingState.successful(data: newData));
    } on Object catch (err, stackTrace) {
      //l.e('An error occurred in the CameraReportingBLoC: $err', stackTrace);
      emit(CameraReportingState.error(data: state.data));
      rethrow;
    } finally {
      emit(CameraReportingState.idle(data: state.data));
    }
  }
}
