import 'package:flutter/material.dart';
import 'package:pai/widgets/components/gaps.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/animations/rotating_animation_widget.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/components/app_text.dart';

class SubscriptionStatusCard extends StatelessWidget {
  final String subscriptionStatus;
  final String subscriptionName;

  const SubscriptionStatusCard({
    super.key,
    required this.subscriptionStatus,
    required this.subscriptionName,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (subscriptionStatus.toLowerCase()) {
      case 'activa':
        statusColor = AppColors.greenSeafoam;
        break;
      case 'cancelada':
        statusColor = AppColors.red;
        break;
      case 'en prueba':
        statusColor = AppColors.orange;
        break;
      default:
        statusColor = AppColors.mediumGrey;
    }

    return Container(
      height: 15.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.greenSeafoam,
            AppColors.accent,
            AppColors.darkBlue,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                "Tu Subscripción",
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              AppGaps.gap2h(),
              AppText(
                subscriptionName,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: AppColors.white,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RotatingWidget(
                child: Icon(
                  Icons.animation_rounded,
                  color: statusColor,
                  size: 16.w,
                ),
              ),
              AppGaps.gap1h(),
              AppText(
                subscriptionStatus,
                fontSize: 16.sp,
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
