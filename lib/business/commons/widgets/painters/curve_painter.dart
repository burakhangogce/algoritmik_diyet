import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class CurvePainter extends CustomPainter {
  CurvePainter({this.shader, this.outSize});

  final Shader? shader;
  final Size? outSize;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    if (outSize != null) {
      size = outSize!;
    }

    var heightMiddle = size.height;
    var heightCorner = heightMiddle * 0.8;

    if (shader == null) {
      paint.shader = gradientBackground.createShader(Rect.fromCenter(
          center: Offset(size.width / 2, heightMiddle / 2),
          width: size.width,
          height: heightMiddle));
    } else {
      paint.shader = shader;
    }

    var path = Path();
    path.moveTo(0, heightCorner);

    path.quadraticBezierTo(
        size.width / 2, heightMiddle, size.width, heightCorner);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
