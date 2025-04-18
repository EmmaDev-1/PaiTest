// File: lib/features/dashboard/iu/widgets/dashboard_appbar.dart

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pai/utils/colors.dart';
import 'package:pai/utils/image_path.dart';
import 'package:pai/widgets/components/app_image.dart';
import 'package:sizer/sizer.dart';

import '../../../../widgets/user_profile_modal.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profileImageUrl;
  final String userEmail;

  const DashboardAppBar({
    super.key,
    required this.userName,
    required this.profileImageUrl,
    required this.userEmail,
  });

  @override
  Size get preferredSize => Size.fromHeight(6.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.transparent,
      actionsPadding: EdgeInsets.symmetric(horizontal: 6.w),
      leadingWidth: 20.w,

      leading: Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: AppImage(imageUrl: ImagePath.appLogo, width: 13.w),
      ),
      actions: [
        GestureDetector(
          onTap:
              () => showUserProfileModal(
                context: context,
                userName: userName,
                userEmail: userEmail,
                profileImageUrl: profileImageUrl,
              ),
          child: AppImage(
            imageUrl: profileImageUrl,
            borderRadius: BorderRadius.circular(60),
            width: 10.w,
            placeholderPath: ImagePath.userPlaceholder,
          ),
        ),
      ],
    );
  }
}
