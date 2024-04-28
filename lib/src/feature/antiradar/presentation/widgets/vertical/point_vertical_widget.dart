import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// {@template point_vertical_widget}
/// PointVerticalWidget widget.
/// {@endtemplate}
class PointVerticalWidget extends StatelessWidget {
  /// {@macro point_vertical_widget}
  const PointVerticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.715),
        child: SvgPicture.asset(
          'assets/icons/point.svg',
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
