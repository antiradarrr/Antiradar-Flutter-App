import 'package:antiradar/src/core/dependencies/dependencies.dart';
import 'package:antiradar/src/core/helpers/audio_player_helper.dart';
import 'package:antiradar/src/core/helpers/notification_helper.dart';
import 'package:antiradar/src/core/helpers/notification_settings/initialization_settigns.dart';
import 'package:antiradar/src/core/helpers/notification_settings/notification_details.dart';
import 'package:antiradar/src/core/utils/logger/logger.dart';
import 'package:antiradar/src/feature/antiradar/domain/entity/nearest_location_entity.dart';
import 'package:antiradar/src/feature/splash_screen/wrappers/localization_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/exceptions/drive_exception.dart';
import '../../domain/enums/speed_limits_status.dart';
import '../bloc/drive_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late DriveBloc driveBloc;

  @override
  void initState() {
    driveBloc = Dependencies.of(context).driveBloc;
    super.initState();
  }

  Future<void> completeListener() async {
    driveBloc.stream.listen((event) {});
  }

  @override
  Widget build(BuildContext context) {
    final langCode = LocalizationWrapper.of(context).currentLangCode;
    return BlocConsumer<DriveBloc, DriveState>(
      bloc: driveBloc,
      listener: (context, state) {
        if (!state.cameraIsEmpty) {
          logger.i('camera fetch completed');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        driveBloc.add(FetchLocalCameraLocation());
                      },
                      child: const Text('Получить лоокальные позиции камер')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () async {
                        driveBloc
                            .add(FetchClosetsCameraLocation(langCode: 'ru'));

                      },
                      child: const Text('Получить ближайшую позицию камеры')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
