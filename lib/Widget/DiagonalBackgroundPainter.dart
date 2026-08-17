import 'package:flutter/material.dart';

class DiagonalBackgroundPainter extends CustomPainter {
  const DiagonalBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFF1F3FD),
          Color(0xFFE4E8FC),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.65);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.15);
    path.lineTo(size.width * 0.1, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}