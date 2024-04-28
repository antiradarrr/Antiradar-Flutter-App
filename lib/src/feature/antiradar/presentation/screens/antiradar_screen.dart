import 'package:antiradar/src/feature/antiradar/presentation/painter/antiradar_vertical_max_painter.dart';
import 'package:antiradar/src/feature/antiradar/presentation/painter/antiradar_vertical_min_painter.dart';
import 'package:antiradar/src/feature/antiradar/presentation/screens/antiradar_horizontal_view_screen.dart';
import 'package:antiradar/src/feature/antiradar/presentation/widgets/distance_widget.dart';
import 'package:antiradar/src/feature/antiradar/presentation/widgets/vertical/point_vertical_widget.dart';
import 'package:antiradar/src/feature/antiradar/presentation/widgets/vertical/speed_vertical_widget.dart';
import 'package:antiradar/src/feature/antiradar/presentation/widgets/vertical/start_button_vertical_widget.dart';
import 'package:antiradar/src/uikit/app_size/form_factor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

/// {@template antiradar_screen}
/// AntiradarScreen widget.
/// {@endtemplate}
class AntiradarScreen extends StatefulWidget {
  /// {@macro antiradar_screen}
  const AntiradarScreen({super.key});

  @override
  State<AntiradarScreen> createState() => _AntiradarScreenState();
}

class _AntiradarScreenState extends State<AntiradarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        switch (orientation) {
          case Orientation.portrait:
            return const PortraintBuillderWidget();
          case Orientation.landscape:
            return const LandscapeBuilderWidget();
        }
      }),
    );
  }
}

/// {@template antiradar_screen}
/// PortraintBuillderWidget widget.
/// {@endtemplate}
class PortraintBuillderWidget extends StatefulWidget {
  /// {@macro antiradar_screen}
  const PortraintBuillderWidget({super.key});

  @override
  State<PortraintBuillderWidget> createState() =>
      _PortraintBuillderWidgetState();
}

class _PortraintBuillderWidgetState extends State<PortraintBuillderWidget> {
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
          const AnitradarBuillder(),
          const SpeedVerticalWidget(speed: 0),
          const StartButtonVerticalWidget(),
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
                                        child: Column(
                                          children: <Widget>[Text('')],
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

/// {@template antiradar_screen}
/// AnitradarBuillder widget.
/// {@endtemplate}
class AnitradarBuillder extends StatelessWidget {
  /// {@macro antiradar_screen}
  const AnitradarBuillder({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constrains) {
            if (constrains.maxHeight < FormFactor.smallHeigh) {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(screenWidth, screenHeight),
                    painter: AntiradarVerticalMinPainter(),
                  ),
                ],
              );
            } else {
              return CustomPaint(
                size: Size(screenWidth, screenHeight),
                painter: AntiradarVerticalMaxPainter(),
                child: Stack(
                  children: <Widget>[
                    DistanceWidget(bottom: screenHeight * 0.78, distance: 800),
                    DistanceWidget(bottom: screenHeight * 0.60, distance: 500),
                    DistanceWidget(bottom: screenHeight * 0.405, distance: 200),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

/// {@template antiradar_scren}
/// {@endtemplate}
class LandscapeBuilderWidget extends StatefulWidget {
  /// {@macro antiradar_screen}
  const LandscapeBuilderWidget({super.key});

  @override
  State<LandscapeBuilderWidget> createState() => _LandscapeBuilderWidgetState();
}

class _LandscapeBuilderWidgetState extends State<LandscapeBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: CustomPaint(
        size: Size(width, height),
        painter: AntiradarHorizontalMaxPainter(),
      ),
    );
  }
}
