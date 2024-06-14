import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../uikit/colors/color_palette.dart';

/// {@template antiradar_horizontal_view_screen}
/// AntiradarHorizontalMaxPainter.
/// {@endtemplate}
base class AntiradarHorizontalMaxPainter extends CustomPainter {
  /// {@macro antiradar_horizontal_view_screen}

  @override
  void paint(Canvas canvas, Size size) {
    final baseElementPainter = Paint();

    baseElementPainter.color = ColorPalette.whiteBlue;
    baseElementPainter.strokeWidth = 1.5;
    baseElementPainter.style = PaintingStyle.stroke;

    final centerCircleRadius = size.width / 6;

    final centerY = size.height / 1.1;
    final centerX = size.width / 2;

    canvas.drawCircle(
        Offset(centerX, centerY), centerCircleRadius, baseElementPainter);

    canvas.drawCircle(Offset(size.width / 2, size.height / 1.3),
        size.height * 0.95, baseElementPainter);

    canvas.drawCircle(Offset(size.width / 2, size.height / 1.1),
        size.height * 0.70, baseElementPainter);

    final trianglePath = Path();

    final triangleCenterX = size.width / 2;
    final triangleCenterY = size.height / 1.3;

    trianglePath.moveTo(triangleCenterX, triangleCenterY);
    trianglePath.lineTo(size.width * 0.30, 0);
    trianglePath.moveTo(triangleCenterX, triangleCenterY);
    trianglePath.lineTo(size.width * 0.70, 0);

    canvas.drawPath(trianglePath, baseElementPainter);

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

    gradientTrianglePath.moveTo(triangleCenterX, triangleCenterY);
    gradientTrianglePath.lineTo(size.width * 0.60, 0);
    gradientTrianglePath.moveTo(triangleCenterX, triangleCenterY);
    gradientTrianglePath.lineTo(size.width * 0.40, 0);
    gradientTrianglePath.lineTo(size.width * 0.60, 0);

    canvas.drawPath(gradientTrianglePath, gradientTrianglePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// {@template antiradar_horizontal_view_screen}
/// AntiradarHorizontalPainter.
/// {@endtemplate}
base class AntiradarHorizontalPainter extends CustomPainter {
  /// {@macro antiradar_horizontal_view_screen}

  @override
  void paint(Canvas canvas, Size size) {
    final baseElementPainter = Paint();

    baseElementPainter.color = ColorPalette.whiteBlue;
    baseElementPainter.strokeWidth = 1.5;
    baseElementPainter.style = PaintingStyle.stroke;

    final centerCircleRadius = size.width / 5;

    final centerY = size.height;
    final centerX = size.width / 2;

    canvas.drawCircle(
        Offset(centerX, centerY), centerCircleRadius, baseElementPainter);

    canvas.drawCircle(Offset(size.width / 2, size.height / 1.40),
        size.height * 0.80, baseElementPainter);

    canvas.drawCircle(Offset(size.width / 2, size.height / 1.1),
        size.height * 0.70, baseElementPainter);
    final trianglePath = Path();

    final triangleCenterX = size.width / 2;
    final triangleCenterY = size.height / 1.3;

    trianglePath.moveTo(triangleCenterX, triangleCenterY);
    trianglePath.lineTo(size.width * 0.70, 0);
    trianglePath.moveTo(triangleCenterX, triangleCenterY);
    trianglePath.lineTo(size.width * 0.30, 0);

    canvas.drawPath(trianglePath, baseElementPainter);

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

    gradientTrianglePath.moveTo(triangleCenterX, triangleCenterY);
    gradientTrianglePath.lineTo(size.width * 0.60, 0);
    gradientTrianglePath.moveTo(triangleCenterX, triangleCenterY);
    gradientTrianglePath.lineTo(size.width * 0.40, 0);
    gradientTrianglePath.lineTo(size.width * 0.60, 0);

    canvas.drawPath(gradientTrianglePath, gradientTrianglePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
