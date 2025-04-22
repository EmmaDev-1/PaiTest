// File: lib/features/create_payment_method/ui/screens/content/payment_method_preview_card.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pai/utils/image_path.dart';
import 'package:pai/widgets/components/app_image.dart';
import 'package:pai/widgets/components/gaps.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/components/app_text.dart';
import '../../../payment_methods/data/models/patment_method.dart';

/// A card widget that flips on tap to reveal CVV on the back.
class PaymentMethodPreviewCard extends StatefulWidget {
  final PaymentMethod paymentMethod;
  final bool isCvvObscured;

  const PaymentMethodPreviewCard({
    Key? key,
    required this.paymentMethod,
    required this.isCvvObscured,
  }) : super(key: key);

  @override
  State<PaymentMethodPreviewCard> createState() =>
      PaymentMethodPreviewCardState();
}

class PaymentMethodPreviewCardState extends State<PaymentMethodPreviewCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void flip() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethod = widget.paymentMethod;
    // Determine logo asset
    String? logoAsset;
    final number = paymentMethod.cardNumber.replaceAll(' ', '');
    if (number.startsWith('4')) {
      logoAsset = ImagePath.visaLogo;
    } else if (number.startsWith('5')) {
      logoAsset = ImagePath.mastercardLogo;
    }

    return GestureDetector(
      onTap: flip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Flip direction
          final isFront = _animation.value <= pi / 2;
          final angle = isFront ? _animation.value : _animation.value - pi;
          return Transform(
            alignment: Alignment.center,
            transform:
                Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
            child: isFront ? _buildFront(logoAsset) : _buildBack(),
          );
        },
      ),
    );
  }

  Widget _buildFront(String? logoAsset) {
    final pm = widget.paymentMethod;
    String displayNumber;
    final digits = pm.cardNumber.replaceAll(' ', '');
    if (digits.isEmpty) {
      displayNumber = 'XXXX XXXX XXXX XXXX';
    } else {
      final buffer = StringBuffer();
      for (var i = 0; i < digits.length; i++) {
        if (i > 0 && i % 4 == 0) buffer.write(' ');
        buffer.write(digits[i]);
      }
      displayNumber = buffer.toString();
    }

    return Container(
      width: double.infinity,
      height: 19.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.mediumGrey.withOpacity(1),
            spreadRadius: 3,
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                pm.bankName.isEmpty ? 'Banco' : pm.bankName,
                color: Colors.white70,
                fontSize: 12.sp,
              ),
              const Spacer(),
              if (logoAsset != null) AppImage(imageUrl: logoAsset, width: 10.w),
            ],
          ),
          AppGaps.gap4h(),
          AppText(
            displayNumber,
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                pm.cardHolderName.isEmpty ? 'Titular' : pm.cardHolderName,
                color: Colors.white,
                fontSize: 12.sp,
              ),
              AppText(
                pm.expirationDate.isEmpty ? 'MM/AA' : pm.expirationDate,
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBack() {
    final pm = widget.paymentMethod;
    return Container(
      width: double.infinity,
      height: 19.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.mediumGrey.withOpacity(1),
            spreadRadius: 3,
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 4.h,
            color: AppColors.black,
          ),
          AppGaps.gap1h(),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppImage(imageUrl: ImagePath.cardChip, width: 9.w),
            ),
          ),
          AppGaps.gap1h(),
          Row(
            children: [
              Expanded(
                child: Container(height: 3.h, color: AppColors.mediumGrey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    AppText('CVV:', color: AppColors.white),
                    AppGaps.gap2w(),
                    AppText(
                      widget.isCvvObscured ? '•••' : pm.cvv,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
