import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/colors.dart';
import '../../../utils/animations/circules_animation_background.dart';
import '../app_text.dart';

class AnimatedBackgroundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const AnimatedBackgroundButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 10.h,
      child: CirculesAnimationBackground(
        child: SizedBox(
          width: 80.w,
          height: 6.h,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: AppText(
              text,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
