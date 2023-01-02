import 'package:flutter/material.dart';

class ChartPassenger extends CustomPainter {
  double posX = 0;
  double posY = 0;

  int gtop, gleft, gbottom, gright;

  ChartPassenger({
    required this.posX,
    required this.posY,
    required this.gtop,
    required this.gleft,
    required this.gbottom,
    required this.gright,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path pathsegitiga = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2, size.height);

    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Paint paintCircle = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Paint paintPathCircle = Paint()
      ..color = const Color(0xff02929A).withOpacity(0.9)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawPath(pathsegitiga, paint);

    double left, top, right, bottom;

    left = 1 - (gleft / 100);
    top = 0.75 - (gtop / 100) / 2;
    right = 0.5 + (gright / 100) / 2;
    bottom = 0.5 + (gbottom / 100) / 2;

    Path pathCircle = Path()
      ..moveTo(size.width / 2 * left, size.height / 2)
      ..lineTo(size.width / 2, size.height / 2 * top)
      ..lineTo(size.width * right, size.height / 2)
      ..lineTo(size.width / 2, size.height * bottom);

    canvas.drawPath(pathCircle, paintPathCircle);

    // Left
    canvas.drawCircle(
        Offset(size.width / 2 * left, size.height / 2), 5, paintCircle);
    // Top
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2 * top), 5, paintCircle);

    // Right
    canvas.drawCircle(
        Offset(size.width * right, size.height / 2), 5, paintCircle);

    // Bottom
    canvas.drawCircle(
        Offset(size.width / 2, size.height * bottom), 5, paintCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
