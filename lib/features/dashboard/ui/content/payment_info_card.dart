import 'package:flutter/material.dart';
import 'package:pai/utils/colors.dart';
import 'package:pai/widgets/components/gaps.dart';
import 'package:sizer/sizer.dart';
import '../../../../widgets/components/app_text.dart';
import '../../data/models/payment.dart';

class PaymentInfoCard extends StatelessWidget {
  final String nextPaymentDate;
  final String paymentAmount;
  final List<Payment> paymentHistory;

  const PaymentInfoCard({
    super.key,
    required this.nextPaymentDate,
    required this.paymentAmount,
    required this.paymentHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.lightPlusGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Next Payment Section
            AppText(
              "Próximo Pago",
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            AppGaps.gap2h(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(nextPaymentDate, textAlign: TextAlign.center),
                AppText(paymentAmount, fontWeight: FontWeight.bold),
              ],
            ),
            AppGaps.gap2h(),

            // Payment History Section
            AppText(
              "Historial de pagos",
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            AppGaps.gap2h(),
            Column(
              children:
                  paymentHistory
                      .map(
                        (payment) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(payment.date),
                              AppText(
                                payment.amount,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
