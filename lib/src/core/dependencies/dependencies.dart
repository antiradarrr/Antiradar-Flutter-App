import 'package:antiradar/src/core/utils/helpers/notification_settings/initialization_settigns.dart';

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

  late final ThemeCubit themeCubit;

  // late final CameraLocalDataSources cameraLocalDataSources;
  // late final CameraClosetsLocationDataSources cameraClosetsLocationDataSources;
  // late final PostLocationDataSources postLocationDataSources;

  // late final PostClosetsLocationRepositoryImpl postLocationRepositoryImpl;
  // late final CameraClosetsLocationRepositoryImpl cameraLocationRepositoryImpl;
  // late final CameraLocalRepositoryImpl cameraLocalRepositoryImpl;
  // late final MockClosetsLocation mockClosetsLocation;
  // late final DriveBloc driveBloc;

  Future<void> initialize() async {
    await NotificationSettings.instance.notificationInitialize();
    // mockClosetsLocation = MockClosetsLocation();
    shar = await SharedPreferences.getInstance();
    localizationController = LocalizationController(sharedPreferences: shar);
    localizationBloc = LocalizationBloc(localizationController);
    themeCubit = ThemeCubit(shar);
    // cameraClosetsLocationDataSources = CameraClosetsLocationDataSources();
    // cameraLocalDataSources = CameraLocalDataSources();
    // postLocationDataSources = PostLocationDataSources();
    // postLocationRepositoryImpl = PostClosetsLocationRepositoryImpl(
    //     closetsLocationDataSources: postLocationDataSources);
    // cameraLocationRepositoryImpl = CameraClosetsLocationRepositoryImpl(
    //     cameraClosetsLocationDataSources: cameraClosetsLocationDataSources);
    // cameraLocalRepositoryImpl = CameraLocalRepositoryImpl(
    //     cameraLocalDataSources: cameraLocalDataSources);
    // driveBloc = DriveBloc(cameraLocationRepositoryImpl,
    //     postLocationRepositoryImpl, cameraLocalRepositoryImpl);
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
