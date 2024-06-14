import 'package:antiradar/src/feature/antiradar/presentation/widgets/distance_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../uikit/app_size/form_factor.dart';
import '../../painter/antiradar_vertical_max_painter.dart';
import '../../painter/antiradar_vertical_min_painter.dart';

class AntiradarBuilder extends StatelessWidget {
  const AntiradarBuilder({super.key});

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
