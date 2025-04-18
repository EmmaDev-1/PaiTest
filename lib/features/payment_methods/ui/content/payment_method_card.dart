import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/components/app_text.dart';
import '../../data/models/patment_method.dart';

/// Widget that displays a single payment method card,
/// with a conditional primary-icon in yellow.
class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final VoidCallback onSetPrimary;

  const PaymentMethodCard({
    Key? key,
    required this.paymentMethod,
    required this.onSetPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Choose filled vs outlined icon based on isPrimary
    final iconData =
        paymentMethod.isPrimary
            ? Icons
                .auto_awesome // filled
            : Icons.auto_awesome_outlined; // outline

    return AspectRatio(
      aspectRatio: 19 / 12,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(paymentMethod.cardBankTypeImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Primary toggle button
            Positioned(
              top: 7.h,
              right: 4.w,
              child: IconButton(
                onPressed: onSetPrimary,
                icon: Icon(iconData),
                color: AppColors.yellow,
                tooltip:
                    paymentMethod.isPrimary
                        ? 'Primary method'
                        : 'Set as primary',
              ),
            ),
            // Card number at bottom
            Positioned(
              bottom: 2.h,
              left: 4.w,
              right: 4.w,
              child: AppText(
                paymentMethod.cardNumber,
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
