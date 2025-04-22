import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';
import 'components/app_image.dart';
import 'components/app_text.dart';
import 'components/gaps.dart';

/// Displays an animated, blurred modal with user profile info.
Future<void> showUserProfileModal({
  required BuildContext context,
  required String userName,
  required String userEmail,
  required String profileImageUrl,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'User Profile',
    barrierColor: AppColors.transparent,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) => const SizedBox.shrink(),
    transitionBuilder: (context, anim, secondaryAnim, _) {
      final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutBack);
      final scale = Tween<double>(begin: 0.85, end: 1.0).animate(curved).value;
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: Container(
            color: AppColors.black.withOpacity(0.6 * anim.value),
            child: Center(
              child: GestureDetector(
                onTap: () {}, // absorb taps on content
                child: Transform.scale(
                  scale: scale,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile image + edit icon
                      Stack(
                        children: [
                          ClipOval(
                            child: AppImage(
                              imageUrl: profileImageUrl,
                              width: 65.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 4.w,
                            right: 4.w,
                            child: Container(
                              width: 9.w,
                              height: 9.w,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit_outlined,
                                size: 5.w,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      AppGaps.gap2h(),
                      AppText(
                        userName,
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        textDirection: TextDecoration.none,
                      ),
                      AppGaps.gap1h(),
                      AppText(
                        userEmail,
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        textDirection: TextDecoration.none,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
