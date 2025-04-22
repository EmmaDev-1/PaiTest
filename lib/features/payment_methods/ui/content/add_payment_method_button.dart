import 'package:flutter/material.dart';
import 'package:pai/utils/colors.dart';
import 'package:sizer/sizer.dart';
import '../../../../widgets/components/app_text.dart';

/// Button widget to simulate the addition of a new payment method.
class AddPaymentMethodButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddPaymentMethodButton({Key? key, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: AppText("Add New Payment Method", fontSize: 14.sp),
    );
  }
}
