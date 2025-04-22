import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pai/utils/colors.dart';
import 'package:sizer/sizer.dart';

import '../app_text.dart';

class SimpleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const SimpleButton({Key? key, required this.onPressed, required this.text})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
