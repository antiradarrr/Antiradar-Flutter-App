import 'package:antiradar/src/core/dependencies/dependencies.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/bloc/localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template localization_wrapper}
/// LocalizationWrapper widget.
/// {@endtemplate}
class LocalizationWrapper extends StatefulWidget {
  /// {@macro localization_wrapper}
  const LocalizationWrapper({super.key, required this.child});

  final Widget child;

  static LocalizationWrapperState of(BuildContext context) {
    return context.findAncestorStateOfType<LocalizationWrapperState>()!;
  }

  @override
  State<LocalizationWrapper> createState() => LocalizationWrapperState();
}

class LocalizationWrapperState extends State<LocalizationWrapper> {
  late final LocalizationBloc _localizationBloc;

  @override
  void initState() {
    super.initState();
    _localizationBloc = Dependencies.of(context).localizationBloc;
    _localizationBloc.add(GetInitialLocale());
  }

  String get currentLangCode => _localizationBloc.state.currentLocale;

  void setLocale(String langCode) {
    _localizationBloc.add(SetLocale(langCode: langCode));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      bloc: _localizationBloc,
      builder: (context, state) {
        return LocalizationScope(
            locale: Locale(state.currentLocale), child: widget.child);
      },
    );
  }
}

/// {@template localization_wrapper}
/// LocalizationScope widget.
/// {@endtemplate}
class LocalizationScope extends InheritedWidget {
  /// {@macro localization_wrapper}
  const LocalizationScope({
    required this.locale,
    required super.child,
    super.key,
  });

  final Locale locale;

  static LocalizationScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocalizationScope>()!;
  }

  @override
  bool updateShouldNotify(LocalizationScope oldWidget) =>
      locale != oldWidget.locale;
}
