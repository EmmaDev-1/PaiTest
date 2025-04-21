// File: lib/utils/animations/circules_animation_background.dart

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pai/utils/colors.dart';
import 'package:sizer/sizer.dart';

/// A background animation of two glowing circles moving over the child widget.
///
/// You can customize the size, movement range, duration, and blur of each circle.
class CirculesAnimationBackground extends StatefulWidget {
  final Widget child;

  /// Movement range in pixels for circle 1 (X and Y axes).
  final double circle1OffsetXRange;
  final double circle1OffsetYRange;

  /// Movement range in pixels for circle 2 (X and Y axes).
  final double circle2OffsetXRange;
  final double circle2OffsetYRange;

  /// Size of circle 1 as percentage of screen width/height.
  final double circle1WidthPercent;
  final double circle1HeightPercent;

  /// Size of circle 2 as percentage of screen width/height.
  final double circle2WidthPercent;
  final double circle2HeightPercent;

  /// Animation duration for a full cycle.
  final Duration duration;

  const CirculesAnimationBackground({
    Key? key,
    required this.child,
    this.circle1OffsetXRange = 120,
    this.circle1OffsetYRange = 5,
    this.circle2OffsetXRange = 120,
    this.circle2OffsetYRange = 5,
    this.circle1WidthPercent = 1,
    this.circle1HeightPercent = 1,
    this.circle2WidthPercent = 1,
    this.circle2HeightPercent = 1,
    this.duration = const Duration(seconds: 14),
  }) : super(key: key);

  @override
  _CirculesAnimationBackgroundState createState() =>
      _CirculesAnimationBackgroundState();
}

class _CirculesAnimationBackgroundState
    extends State<CirculesAnimationBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _circle1OffsetX = 0;
  double _circle1OffsetY = 0;
  double _circle2OffsetX = 0;
  double _circle2OffsetY = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.duration)
          ..addListener(() {
            setState(() {
              final t = _controller.value;
              _circle1OffsetX =
                  widget.circle1OffsetXRange * math.sin(2 * math.pi * t);
              _circle1OffsetY =
                  widget.circle1OffsetYRange * math.cos(2 * math.pi * t);
              _circle2OffsetX =
                  widget.circle2OffsetXRange * math.sin(2 * math.pi * t + 1);
              _circle2OffsetY =
                  widget.circle2OffsetYRange * math.cos(2 * math.pi * t + 1);
            });
          })
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Circle 1
            Positioned(
              left:
                  constraints.maxWidth / 2 -
                  widget.circle1WidthPercent.w +
                  _circle1OffsetX,
              top:
                  constraints.maxHeight / 2 -
                  widget.circle1HeightPercent.h * 1.5 +
                  _circle1OffsetY,
              child: Container(
                width: widget.circle1WidthPercent.w,
                height: widget.circle1HeightPercent.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(0, 69, 227, 182),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greenSeafoam,
                      blurRadius: 40,
                      spreadRadius: 40,
                    ),
                  ],
                ),
              ),
            ),

            // Circle 2
            Positioned(
              right:
                  constraints.maxWidth / 2 -
                  widget.circle2WidthPercent.w +
                  _circle2OffsetX,
              bottom:
                  constraints.maxHeight / 2 -
                  widget.circle2HeightPercent.h +
                  _circle2OffsetY,
              child: Container(
                width: widget.circle2WidthPercent.w,
                height: widget.circle2HeightPercent.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(0, 29, 76, 230),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accent,
                      blurRadius: 40,
                      spreadRadius: 40,
                    ),
                  ],
                ),
              ),
            ),

            // Child widget
            widget.child,
          ],
        );
      },
    );
  }
}
