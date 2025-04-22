// File: lib/features/dashboard/iu/widgets/payment_info_card.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/utils/colors.dart';
import 'package:pai/widgets/components/app_text.dart';
import 'package:pai/widgets/components/gaps.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/app_toast.dart';
import '../../data/models/payment.dart';

/// A card showing scheduled payment and payment history, with expandable sections.
class PaymentInfoCard extends StatefulWidget {
  /// Next scheduled payment date and amount.
  final String nextPaymentDate;
  final String paymentAmount;

  /// Full history of payments.
  final List<Payment> paymentHistory;

  const PaymentInfoCard({
    Key? key,
    required this.nextPaymentDate,
    required this.paymentAmount,
    required this.paymentHistory,
  }) : super(key: key);

  @override
  State<PaymentInfoCard> createState() => _PaymentInfoCardState();
}

class _PaymentInfoCardState extends State<PaymentInfoCard>
    with TickerProviderStateMixin {
  bool _showNext = false;
  bool _showHistory = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGaps.gap2h(),
        AppText("Vínculos rápidos", color: AppColors.mediumGrey),
        AppGaps.gap1h(),
        Card(
          color: AppColors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Scheduled Payment Header
              _buildHeader(
                icon: Icons.schedule,
                title: 'Pago programado',
                isExpanded: _showNext,
                onTap: () => setState(() => _showNext = !_showNext),
              ),
              // Animated expansion for next payment details
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child:
                    _showNext
                        ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppGaps.gap1h(),
                              AppText(
                                'Próxima Fecha:',
                                fontWeight: FontWeight.w600,
                              ),
                              AppGaps.gap1h(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(widget.nextPaymentDate),
                                  AppText(
                                    widget.paymentAmount,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              AppGaps.gap2h(),
                            ],
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Divider(color: AppColors.lightPlusGrey),
              ),

              // History Header
              _buildHeader(
                icon: Icons.history,
                title: 'Historial de pagos',
                isExpanded: _showHistory,
                onTap: () => setState(() => _showHistory = !_showHistory),
              ),
              // Animated expansion for payment history list
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child:
                    _showHistory
                        ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            children:
                                widget.paymentHistory.map((payment) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(payment.date),
                                        AppText(
                                          payment.amount,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Divider(color: AppColors.lightPlusGrey),
              ),
              // History Header
              _buildHeader(
                icon: Icons.payment_rounded,
                title: 'Métodos de pago',
                isExpanded: false,
                onTap: () {
                  context.push('/paymentMethods');
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Divider(color: AppColors.lightPlusGrey),
              ),
              // History Header
              _buildHeader(
                icon: Icons.password,
                title: 'Actualizar contraseña',
                isExpanded: false,
                onTap: () {
                  AppToast.show(
                    context: context,
                    message: 'Por el momento no contamos con esta función',
                    type: AppToastType.warning,
                  );
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Divider(color: AppColors.lightPlusGrey),
              ),
              // History Header
              _buildHeader(
                icon: Icons.settings_outlined,
                title: 'Editar configuración',
                isExpanded: _showHistory,
                onTap: () {
                  AppToast.show(
                    context: context,
                    message: 'Por el momento no contamos con esta función',
                    type: AppToastType.warning,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader({
    required IconData icon,
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return InkWell(
      highlightColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        child: Row(
          children: [
            Icon(icon, color: AppColors.black, size: 20),
            AppGaps.gap2w(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [AppText(title, fontWeight: FontWeight.bold)],
              ),
            ),
            Transform.rotate(
              angle: isExpanded ? 2 * 3.1416 : 4.7,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 6.w,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
