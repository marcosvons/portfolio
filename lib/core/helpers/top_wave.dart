import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ArtisticBackgroundClipper extends CustomClipper<Path> {
  // Control points for the quadratic Bezier curves
  final double controlPoint1 = 0.15;
  final double controlPoint2 = 0.25;
  final double controlPoint3 =
      0.4; // Increase this value for a bigger middle section
  final double controlPoint4 =
      0.55; // Increase this value for a bigger middle section
  final double controlPoint5 =
      0.67; // Increase this value for a bigger middle section
  final double controlPoint6 =
      0.8; // Increase this value for a bigger middle section
  final double controlPoint7 =
      0.9; // Increase this value for a bigger middle section
  final double controlPoint8 = 0.7;
  final double controlPoint9 = 0.87;
  final double controlPoint10 =
      0.9; // Increase this value for a bigger middle section
  final double controlPoint11 = 0.9;
  final double controlPoint12 = 0.15;
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.4)
      ..quadraticBezierTo(
        size.width * controlPoint1,
        size.height * 0.35,
        size.width * controlPoint2,
        size.height * 0.25,
      )
      ..quadraticBezierTo(
        size.width * controlPoint3,
        size.height * 0.1,
        size.width * controlPoint4,
        size.height * 0.2,
      )
      ..quadraticBezierTo(
        size.width * controlPoint5,
        size.height * 0.3,
        size.width * controlPoint6,
        size.height * 0.25,
      )
      ..quadraticBezierTo(
        size.width * controlPoint7,
        size.height * 0.23,
        size.width,
        size.height * 0.05,
      )
      ..lineTo(size.width, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * controlPoint7,
        size.height * 0.67,
        size.width * controlPoint6,
        size.height * 0.75,
      )
      ..quadraticBezierTo(
        size.width * controlPoint5,
        size.height * 0.87,
        size.width * controlPoint4,
        size.height * controlPoint10,
      )
      ..quadraticBezierTo(
        size.width * controlPoint3,
        size.height * controlPoint11,
        size.width * controlPoint2,
        size.height * 0.85,
      )
      ..quadraticBezierTo(
        size.width * controlPoint1,
        size.height * 0.83,
        0,
        size.height,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(ArtisticBackgroundClipper oldClipper) => false;
}
