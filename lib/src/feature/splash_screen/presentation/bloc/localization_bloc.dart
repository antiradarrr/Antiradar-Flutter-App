import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/splash_screen/controller/localization_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc(
    this._localizationController,
  ) : super(LocalizationState()) {
    on<GetInitialLocale>(_getInitialLocale);
    on<SetLocale>(_setLocale);
  }

  Future<void> _getInitialLocale(
      GetInitialLocale event, Emitter<LocalizationState> emit) async {
    await _localizationController
        .getLangCode()
        .then((locale) => emit(LocalizationState(currentLocale: locale)));
  }

  Future<void> _setLocale(
      SetLocale event, Emitter<LocalizationState> emit) async {
    await _localizationController.setLocale(event.langCode);

    emit(LocalizationState(currentLocale: event.langCode));
  }

  final LocalizationController _localizationController;

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e('LocalizaitonBloc', error: error, stackTrace: stackTrace);
    super.onError(error, stackTrace);
  }
}

/// {@template localization_bloc}
/// LocalizationState.
/// {@endtemplate}
base class LocalizationState {
  /// {@macro localization_bloc}
  LocalizationState({this.currentLocale = 'en'});

  final String currentLocale;

  String get locale => currentLocale;
}

/// {@template localization_bloc}
/// LocalizationEvent.
/// {@endtemplate}
abstract class LocalizationEvent extends Equatable {
  /// {@macro localization_bloc}
}

/// {@template localization_bloc}
/// GetInitialLocale.
/// {@endtemplate}
final class GetInitialLocale extends LocalizationEvent {
  /// {@macro localization_bloc}

  @override
  List<Object?> get props => [];
}

/// {@template localization_bloc}
/// SetLocale.
/// {@endtemplate}
final class SetLocale extends LocalizationEvent {
  /// {@macro localization_bloc}
  SetLocale({required this.langCode});

  final String langCode;

  @override
  List<Object?> get props => [langCode];
}
