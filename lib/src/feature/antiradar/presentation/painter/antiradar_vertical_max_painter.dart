import 'dart:math' as math;

import 'package:flutter/material.dart';

/// {@template antiradar_painter}
/// AntiradarVerticalMaxPainter.
/// {@endtemplate}
base class AntiradarVerticalMaxPainter extends CustomPainter {
  /// {@macro antiradar_painter}
  @override
  void paint(Canvas canvas, Size size) {
    final firstCircleDxPosition = size.width / 2;
    final firstCircleDyPosition = size.height / 1.4;
    var paint = Paint()
      ..color = const Color(0xFFC9DBE4)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final firstCircleRadius = size.height * 0.15;
    canvas.drawCircle(Offset(firstCircleDxPosition, firstCircleDyPosition),
        firstCircleRadius, paint);

    final double radius = size.width;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 1.55), radius: radius),
        math.pi,
        math.pi,
        false,
        paint);

    final arcPainter = Paint()
      ..color = const Color(0xFFC9DBE4)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 1.2;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      math.pi,
      math.pi,
      false,
      arcPainter,
    );

    final trianglePainter = Paint();
    trianglePainter.strokeWidth = 2.0;
    trianglePainter.style = PaintingStyle.stroke;
    trianglePainter.color = const Color(0xFFC9DBE4);

    final trianglePath = Path();

    final triangleXPosition = size.width / 2;
    final triangleYPosition = size.height * 0.73;

    trianglePath.moveTo(triangleXPosition, triangleYPosition);
    trianglePath.lineTo(size.width, size.height * 0.28);
    trianglePath.moveTo(size.width / 2, size.height * 0.73);
    trianglePath.lineTo(0, size.height * 0.28);

    canvas.drawPath(trianglePath, trianglePainter);

    final gradientTrianglePainter = Paint();
    gradientTrianglePainter.color = Colors.black;
    gradientTrianglePainter.style = PaintingStyle.fill;
    gradientTrianglePainter.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(42, 109, 236, 0),
        Color.fromRGBO(36, 110, 250, 0.28),
        Color.fromRGBO(39, 107, 237, 0.3),
      ],
      stops: [0.0, 0.8, 1.0],
    ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
    final gradientTrianglePath = Path();

    gradientTrianglePath.moveTo(triangleXPosition, triangleYPosition);
    gradientTrianglePath.lineTo(size.width * 0.2, 0);
    gradientTrianglePath.moveTo(triangleXPosition, triangleYPosition);
    gradientTrianglePath.lineTo(size.width * 0.8, 0);
    gradientTrianglePath.lineTo(size.width * 0.2, 0);

    canvas.drawPath(gradientTrianglePath, gradientTrianglePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
