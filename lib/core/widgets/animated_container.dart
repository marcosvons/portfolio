import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverAndRedirectContainer extends StatefulWidget {
  const HoverAndRedirectContainer({
    Key? key,
    required this.url,
    required this.child,
    this.hoverScale = 1.1,
    this.shadowColor = Colors.black12,
    this.shadowBlurRadius = 8.0,
    this.shadowSpreadRadius = 0.0,
    this.shadowOffset = const Offset(0, 2),
  }) : super(key: key);

  final String url;
  final Widget child;
  final double hoverScale;
  final Color shadowColor;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final Offset shadowOffset;

  @override
  _HoverAndRedirectContainerState createState() =>
      _HoverAndRedirectContainerState();
}

class _HoverAndRedirectContainerState extends State<HoverAndRedirectContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: GestureDetector(
        onTap: _launchURL,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 1.0,
            end: _isHovered ? widget.hoverScale : 1.0,
          ),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          builder: (BuildContext context, double scale, Widget? child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: widget.shadowColor,
                  blurRadius: widget.shadowBlurRadius,
                  spreadRadius: widget.shadowSpreadRadius,
                  offset: widget.shadowOffset,
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  Future<void> _launchURL() async {
    if (await canLaunchUrl(Uri.parse(widget.url))) {
      await launchUrl(Uri.parse(widget.url));
    } else {
      throw 'Could not launch ${widget.url}';
    }
  }
}
