import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
    required this.initialColor,
    required this.hoverColor,
    required this.text,
    required this.onPressed,
    this.duration = const Duration(milliseconds: 200),
  });
  final Color initialColor;
  final Color hoverColor;
  final String text;
  final VoidCallback onPressed;
  final Duration duration;

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
      end: widget.hoverColor,
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
            width: context.width * 0.15,
            height: context.height * 0.075,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                colors: [
                  if (_isHovered)
                    context.colorScheme.tertiary
                  else
                    widget.initialColor,
                  if (_isHovered)
                    const Color(0xFF7BF4E8)
                  // const Color(0xFFF05D5E)
                  else
                    _colorAnimation.value ?? widget.initialColor,
                ],
              ),
              borderRadius: BorderRadius.circular(Dimens.xSmall),
            ),
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                widget.text,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: Fonts.narnoor,
                ),
              ),
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
