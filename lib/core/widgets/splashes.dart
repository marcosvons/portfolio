import 'dart:math';

import 'package:flutter/rendering.dart';

class DecorativeSpotsPainter extends CustomPainter {
  DecorativeSpotsPainter({required this.numSpots, required this.spotColor});
  final int numSpots;
  final Color spotColor;

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();
    final paint = Paint()..color = spotColor;

    for (var i = 0; i < numSpots; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final control1X = random.nextDouble() * size.width;
      final control1Y = random.nextDouble() * size.height;
      final control2X = random.nextDouble() * size.width;
      final control2Y = random.nextDouble() * size.height;
      final endX = random.nextDouble() * size.width;
      final endY = random.nextDouble() * size.height;

      final path = Path()
        ..moveTo(startX, startY)
        ..cubicTo(
          control1X,
          control1Y,
          control2X,
          control2Y,
          endX,
          endY,
        )
        ..lineTo(startX, startY)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
