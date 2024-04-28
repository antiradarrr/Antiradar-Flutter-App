import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';

/// {@template antiradar_screen}
/// DistanceWidget widget.
/// {@endtemplate}
class DistanceWidget extends StatelessWidget {
  /// {@macro antiradar_screen}
  const DistanceWidget({
    super.key,
    this.distance = 0,
    this.bottom = 0,
  });

  final int distance;
  final double bottom;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: Text(
          '${distance}m',
          style: AppTextStyles.distanceTextStyle,
        ),
      ),
    );
  }
}
