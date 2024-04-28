import 'package:antiradar/src/feature/antiradar/data/data_souces/driwe_data_sources.dart';
import 'package:antiradar/src/feature/antiradar/data/data_souces/read_excel_data_sources.dart.dart';
import 'package:antiradar/src/feature/antiradar/data/repositories/driwe_repository_impl.dart';
import 'package:antiradar/src/feature/antiradar/data/repositories/read_excel_repository_impl.dart';
import 'package:antiradar/src/feature/antiradar/presentation/bloc/antiradar_bloc.dart';
import 'package:antiradar/src/feature/splash_screen/controller/localization_controller.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/bloc/localization_bloc.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template dependencies}
/// Dependencies.
/// {@endtemplate}
final class Dependencies {
  /// {@macro dependencies}

  late final SharedPreferences shar;
  late final LocalizationController localizationController;
  late final LocalizationBloc localizationBloc;

  late final ReadExcelDataSources readExcelDataSources;
  late final DriweDataSources driweDataSources;
  late final DriweRepositoryImpl driweRepositoryImpl;
  late final ReadExcelRepositoryImpl readExcelRepositoryImpl;
  late final AntiradarBloc antiradarBloc;

  late final ThemeCubit themeCubit;
  Future<void> initialize() async {
    shar = await SharedPreferences.getInstance();

    localizationController = LocalizationController(sharedPreferences: shar);
    localizationBloc = LocalizationBloc(localizationController);
    readExcelDataSources = ReadExcelDataSources();
    driweDataSources = DriweDataSources();
    driweRepositoryImpl =
        DriweRepositoryImpl(driweDataSources: driweDataSources);
    readExcelRepositoryImpl =
        ReadExcelRepositoryImpl(readExcelDataSources: readExcelDataSources);
    antiradarBloc = AntiradarBloc(driweRepositoryImpl, readExcelRepositoryImpl);
    themeCubit = ThemeCubit(shar);
  }

  static Dependencies of(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<DependenciesScope>()!
        .dependencies;
  }
}

/// {@template dependencies}
/// DependenciesScope widget.
/// {@endtemplate}
class DependenciesScope extends InheritedWidget {
  /// {@macro dependencies}
  const DependenciesScope({
    required this.dependencies,
    required super.child,
    super.key,
  });

  final Dependencies dependencies;

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) => false;
}
