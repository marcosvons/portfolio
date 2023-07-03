import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height)
      ..cubicTo(
        size.width * 0.15,
        size.height * 0.9,
        size.width * 0.2,
        size.height * 0.7,
        size.width * 0.4,
        size.height * 0.8,
      )
      ..cubicTo(
        size.width * 0.5,
        size.height * 0.9,
        size.width * 0.7,
        size.height,
        size.width,
        size.height * 0.85,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => false;
}
