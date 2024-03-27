import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    required this.initialColor,
    required this.hoversColor,
    required this.child,
    required this.onPressed,
    required this.constraints,
    this.duration = const Duration(milliseconds: 200),
  });
  final Color initialColor;
  final List<Color> hoversColor;
  final Widget child;
  final VoidCallback onPressed;
  final Duration duration;
  final BoxConstraints constraints;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _colorAnimation = ColorTween(
      begin: widget.initialColor,
      end: widget.hoversColor[0],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: widget.constraints.maxWidth > Resolutions.mobileMaxWidth
                ? context.width * 0.15
                : context.width * 0.45,
            height: context.height * 0.075,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.25,
                colors: [
                  if (_isHovered)
                    widget.hoversColor[0]
                  else
                    widget.initialColor,
                  if (_isHovered)
                    widget.hoversColor.length > 1
                        ? widget.hoversColor[1]
                        : widget.hoversColor[0]
                  else
                    widget.initialColor,
                ],
              ),
              borderRadius: BorderRadius.circular(Dimens.xSmall),
            ),
            child: GestureDetector(
              onTap: widget.onPressed,
              child: Center(child: widget.child),
            ),
          );
        },
      ),
    );
  }

  void _mouseEnter(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (_isHovered) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
}
