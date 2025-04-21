import 'package:flutter/material.dart';
import 'package:pai/widgets/components/gaps.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/animations/circules_animation_background.dart';
import '../../../../utils/app_toast.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/image_path.dart';
import '../../../../widgets/components/app_image.dart';
import '../../../../widgets/components/app_text.dart';

class SubscriptionStatusCard extends StatelessWidget {
  final String subscriptionStatus;
  final String subscriptionName;
  final String nextPaymentDate;

  const SubscriptionStatusCard({
    super.key,
    required this.subscriptionStatus,
    required this.subscriptionName,
    required this.nextPaymentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGaps.gap1h(),
        AppText("Cuenta", fontSize: 18.sp, fontWeight: FontWeight.bold),
        AppText("Información de la subscripción", color: AppColors.mediumGrey),
        SizedBox(
          height: 25.h,
          child: CirculesAnimationBackground(
            // Mueve menos en Y, más en X
            circle1OffsetXRange: 130,
            circle1OffsetYRange: 20,
            // Tamaño de círculo 1: 5% ancho, 5% alto
            circle1WidthPercent: 6,
            circle1HeightPercent: 6,
            // Círculo 2 más pequeño
            circle2WidthPercent: 6,
            circle2HeightPercent: 6,
            duration: const Duration(seconds: 8),
            child: Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGaps.gap1h(),
                  Container(
                    width: 60.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [AppColors.darkBlue, AppColors.accent],
                      ),
                    ),
                    child: Center(
                      child: AppText(
                        "Miebro desde enero de 2025",
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGaps.gap2h(),
                        AppText(
                          "Subscripción $subscriptionStatus $subscriptionName",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        AppGaps.gap1h(),
                        AppText(
                          "Próximo pago: $nextPaymentDate",
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGrey,
                        ),
                        AppGaps.gap1h(),
                        Row(
                          children: [
                            AppImage(
                              imageUrl: ImagePath.mastercardLogo,
                              width: 7.w,
                            ),
                            AppGaps.gap2w(),
                            AppText(
                              "•••• •••• •••• 5262",
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkGrey,
                            ),
                          ],
                        ),
                        AppGaps.gap1h(),
                        Divider(color: AppColors.lightPlusGrey),
                        InkWell(
                          highlightColor: AppColors.transparent,
                          splashColor: AppColors.transparent,
                          onTap: () {
                            AppToast.show(
                              context: context,
                              message:
                                  'Por el momento no contamos con esta función',
                              type: AppToastType.warning,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  "Administrar membresía",
                                  fontWeight: FontWeight.bold,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 4.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
