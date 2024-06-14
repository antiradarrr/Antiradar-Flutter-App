import 'package:antiradar/src/feature/antiradar/presentation/widgets/vertical/antiradar_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/drive_bloc.dart';
import '../../widgets/vertical/point_vertical_widget.dart';
import '../../widgets/vertical/speed_vertical_widget.dart';
import '../../widgets/vertical/start_button_vertical_widget.dart';

class AntiradarVerticalScreen extends StatefulWidget {
  const AntiradarVerticalScreen({super.key, required this.driveState});

  final DriveState driveState;

  @override
  State<AntiradarVerticalScreen> createState() =>
      _AntiradarVerticalScreenState();
}

class _AntiradarVerticalScreenState extends State<AntiradarVerticalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      child: Stack(
        children: [
          const AntiradarBuilder(),
          const SpeedVerticalWidget(),
          StartButtonVerticalWidget(
            driveStatus: widget.driveState.driveStatus,
          ),
          const PointVerticalWidget(),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.67,
              ),
              child: AspectRatio(
                aspectRatio: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.7,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xFF000000)
                                                    .withOpacity(0.01),
                                                offset: const Offset(0, -1),
                                                blurRadius: 6.6,
                                                spreadRadius: 66,
                                              )
                                            ]),
                                        child: const Column(
                                          children: <Widget>[
                                            Text(
                                              'hello world',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child:
                                  SvgPicture.asset('assets/icons/camera.svg'))),
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFF000000).withOpacity(0.15),
                                offset: const Offset(0, 4),
                                blurRadius: 16,
                                spreadRadius: 0,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Expanded(
                                child:
                                    SvgPicture.asset('assets/icons/add.svg')),
                            Expanded(
                                child: SvgPicture.asset(
                                    'assets/icons/volume_up.svg'))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
