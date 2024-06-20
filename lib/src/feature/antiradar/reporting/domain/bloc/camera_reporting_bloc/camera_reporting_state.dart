// ignore_for_file: doc_directive_missing_opening_tag, doc_directive_missing_argument

part of 'camera_reporting_bloc.dart';


/// Entity placeholder for CameraReportingState
/// {@endtemplate}
typedef CameraReportingEntity = Object;

/// {@template }
/// CameraReportingState.
/// {@endtemplate}
sealed class CameraReportingState extends _$CameraReportingStateBase {
  /// Idling state
  /// {@macro }
  const factory CameraReportingState.idle({
    required CameraReportingEntity? data,
    String message,
  }) = CameraReportingState$Idle;

  /// Processing
  /// {@macro }
  const factory CameraReportingState.processing({
    required CameraReportingEntity? data,
    String message,
  }) = CameraReportingState$Processing;

  /// Successful
  /// {@macro }
  const factory CameraReportingState.successful({
    required CameraReportingEntity? data,
    String message,
  }) = CameraReportingState$Successful;

  /// An error has occurred
  /// {@macro }
  const factory CameraReportingState.error({
    required CameraReportingEntity? data,
    String message,
  }) = CameraReportingState$Error;

  /// {@macro }
  const CameraReportingState({required super.data, required super.message});
}

/// Idling state
/// {@nodoc}
final class CameraReportingState$Idle extends CameraReportingState with _$CameraReportingState {
  /// {@nodoc}
  const CameraReportingState$Idle({required super.data, super.message = 'Idling'});
}

/// Processing
/// {@nodoc}
final class CameraReportingState$Processing extends CameraReportingState with _$CameraReportingState {
  /// {@nodoc}
  const CameraReportingState$Processing({required super.data, super.message = 'Processing'});
}

/// Successful
/// {@nodoc}
final class CameraReportingState$Successful extends CameraReportingState with _$CameraReportingState {
  /// {@nodoc}
  const CameraReportingState$Successful({required super.data, super.message = 'Successful'});
}

/// Error
/// {@nodoc}
final class CameraReportingState$Error extends CameraReportingState with _$CameraReportingState {
  /// {@nodoc}
  const CameraReportingState$Error({required super.data, super.message = 'An error has occurred.'});
}

/// {@nodoc}
base mixin _$CameraReportingState on CameraReportingState {}

/// Pattern matching for [CameraReportingState].
typedef CameraReportingStateMatch<R, S extends CameraReportingState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _$CameraReportingStateBase {
  /// {@nodoc}
  const _$CameraReportingStateBase({required this.data, required this.message});

  /// Data entity payload.
  @nonVirtual
  final CameraReportingEntity? data;

  /// Message or state description.
  @nonVirtual
  final String message;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state?
  bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing;

  /// Pattern matching for [CameraReportingState].
  R map<R>({
    required CameraReportingStateMatch<R, CameraReportingState$Idle> idle,
    required CameraReportingStateMatch<R, CameraReportingState$Processing> processing,
    required CameraReportingStateMatch<R, CameraReportingState$Successful> successful,
    required CameraReportingStateMatch<R, CameraReportingState$Error> error,
  }) =>
      switch (this) {
        CameraReportingState$Idle s => idle(s),
        CameraReportingState$Processing s => processing(s),
        CameraReportingState$Successful s => successful(s),
        CameraReportingState$Error s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [CameraReportingState].
  R maybeMap<R>({
    CameraReportingStateMatch<R, CameraReportingState$Idle>? idle,
    CameraReportingStateMatch<R, CameraReportingState$Processing>? processing,
    CameraReportingStateMatch<R, CameraReportingState$Successful>? successful,
    CameraReportingStateMatch<R, CameraReportingState$Error>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [CameraReportingState].
  R? mapOrNull<R>({
    CameraReportingStateMatch<R, CameraReportingState$Idle>? idle,
    CameraReportingStateMatch<R, CameraReportingState$Processing>? processing,
    CameraReportingStateMatch<R, CameraReportingState$Successful>? successful,
    CameraReportingStateMatch<R, CameraReportingState$Error>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}
