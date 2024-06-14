import 'package:antiradar/src/core/dependencies/dependencies.dart';
import 'package:antiradar/src/feature/antiradar/presentation/bloc/drive_bloc.dart';

import 'package:antiradar/src/feature/antiradar/presentation/screens/horizontal_screens/antiradar_horizontal_screen.dart';
import 'package:antiradar/src/feature/antiradar/presentation/screens/vertical_layout/antiradar_vertical_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AntiradarScreen extends StatefulWidget {
  const AntiradarScreen({super.key});

  @override
  State<AntiradarScreen> createState() => _AntiradarScreenState();
}

class _AntiradarScreenState extends State<AntiradarScreen> {
  late final DriveBloc driveBloc;

  @override
  void initState() {
    driveBloc = Dependencies.of(context).driveBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriveBloc, DriveState>(
      bloc: driveBloc..add(FetchLocalCameraLocation()),
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: OrientationBuilder(builder: (context, orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return AntiradarVerticalScreen(driveState: driveBloc.state);
              case Orientation.landscape:
                return const AntiradarHorizontalScreen();
            }
          }),
        );
      },
    );
  }
}
