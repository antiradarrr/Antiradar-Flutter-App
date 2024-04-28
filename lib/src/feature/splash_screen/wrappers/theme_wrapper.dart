import 'package:antiradar/src/core/dependencies/dependencies.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template theme_wrapper}
/// ThemeWrapper widget.
/// {@endtemplate}
class ThemeWrapper extends StatefulWidget {
  /// {@macro theme_wrapper}
  const ThemeWrapper({super.key, required this.child});

  final Widget child;
  static ThemeWrapperState of(BuildContext context) {
    return context.findAncestorStateOfType<ThemeWrapperState>()!;
  }

  @override
  State<ThemeWrapper> createState() => ThemeWrapperState();
}

class ThemeWrapperState extends State<ThemeWrapper> {
  late ThemeCubit _themeCubit;

  @override
  void initState() {
    super.initState();
    _themeCubit = Dependencies.of(context).themeCubit;
  }

  Future<void> changeTheme() async => await _themeCubit.changeTheme();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      bloc: _themeCubit,
      builder: (context, state) {
        return ThemeScope(themeMode: _themeCubit.theme, child: widget.child);
      },
    );
  }
}

/// {@template theme_wrapper}
/// ThemeScope widget.
/// {@endtemplate}
class ThemeScope extends InheritedWidget {
  /// {@macro theme_wrapper}
  const ThemeScope({
    required this.themeMode,
    required super.child,
    super.key,
  });

  final ThemeMode themeMode;

  static ThemeScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeScope>()!;
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) =>
      themeMode != oldWidget.themeMode;
}
