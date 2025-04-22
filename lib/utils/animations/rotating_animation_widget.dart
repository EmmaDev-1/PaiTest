// rotating_icon.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  final Widget child;

  final Duration duration;

  final bool clockwise;

  const RotatingWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 4),
    this.clockwise = true,
  }) : super(key: key);

  @override
  _RotatingWidgetState createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double angle =
            widget.clockwise
                ? _controller.value * 2 * math.pi
                : -_controller.value * 2 * math.pi;
        return Transform(
          transform: Matrix4.rotationZ(angle),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
