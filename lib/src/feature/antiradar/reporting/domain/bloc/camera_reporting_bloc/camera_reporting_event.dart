part of 'camera_reporting_bloc.dart';

/// Business Logic Component CameraReportingEvent
@immutable
sealed class CameraReportingEvent extends _$CameraReportingEventBase {
  const CameraReportingEvent();

  const factory CameraReportingEvent.fetch({
    required String name,
  }) = _FetchCameraReportingEvent;

}

final class _FetchCameraReportingEvent extends CameraReportingEvent {
  const _FetchCameraReportingEvent({
    required this.name,
  }) : super();

  final String name;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('CameraReportingEvent.fetch(')
      ..write('name: $name, ')
      ..write(')');
    return buffer.toString();
  }
}

typedef CameraReportingEventMatch<R, E extends CameraReportingEvent> = R Function(E event);

abstract base class _$CameraReportingEventBase {
  const _$CameraReportingEventBase();

  R map<R>({
    required CameraReportingEventMatch<R, _FetchCameraReportingEvent> fetch,
  }) =>
    switch (this) {
      final _FetchCameraReportingEvent e => fetch(e),
      _ => throw AssertionError(),
    };

  R maybeMap<R>({
    required R Function() orElse,
    CameraReportingEventMatch<R, _FetchCameraReportingEvent>? fetch,
  }) =>
    map<R>(
      fetch: fetch ?? (_) => orElse(),
    );

  R? mapOrNull<R>({
    CameraReportingEventMatch<R, _FetchCameraReportingEvent>? fetch,
  }) =>
    map<R?>(
      fetch: fetch ?? (_) => null,
    );
}
