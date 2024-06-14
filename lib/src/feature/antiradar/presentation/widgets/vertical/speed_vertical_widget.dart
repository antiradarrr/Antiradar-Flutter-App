import 'package:antiradar/src/uikit/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// {@template speed_vertical_widget}
/// SpeedVerticalWidget widget.
/// {@endtemplate}
class SpeedVerticalWidget extends StatefulWidget {
  /// {@macro speed_vertical_widget}
  const SpeedVerticalWidget({super.key});

  @override
  State<SpeedVerticalWidget> createState() => _SpeedVerticalWidgetState();
}

class _SpeedVerticalWidgetState extends State<SpeedVerticalWidget> {
  @override
  void initState() {
    super.initState();
    Geolocator.getPositionStream().listen((event) {
      setState(() {
        speed = event.speed.toInt();
      });
    });
  }

  int speed = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topRight,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, top: 24),
          child: SizedBox(
            height: 75,
            width: 75,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.buttonTheme.colorScheme!.background,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.15),
                    offset: const Offset(0, 4),
                    blurRadius: 14,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  heightFactor: 0.9,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '$speed',
                      style: AppTextStyles.speedTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
