import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/home/home.dart';

class HoverAndRedirectContainer extends StatefulWidget {
  const HoverAndRedirectContainer({
    super.key,
    required this.child,
    required this.onPressed,
    this.hoverScale = 1.1,
  });

  final Widget child;
  final double hoverScale;
  final VoidCallback onPressed;

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
        onTap: widget.onPressed,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 1,
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
          child: widget.child,
        ),
      ),
    );
  }

  void _mouseEnter(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}

void buildPopupContainer(
  BuildContext context, {
  required String title,
  required String description,
  required List<String> images,
  required BoxConstraints constraints,
  String? codeLink,
  String? projectLink,
  String? appStoreLink,
  String? playStoreLink,
  String? video,
}) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          width: constraints.maxWidth > Resolutions.mobileMaxWidth
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width,
          height: constraints.maxWidth > Resolutions.mobileMaxWidth
              ? MediaQuery.of(context).size.height * 0.8
              : MediaQuery.of(context).size.height * 0.95,
          child: ProjectDetail(
            title: title,
            description: description,
            images: images,
            codeLink: codeLink,
            projectLink: projectLink,
            appStoreLink: appStoreLink,
            playStoreLink: playStoreLink,
            video: video,
          ),
        ),
      );
    },
  );
}
