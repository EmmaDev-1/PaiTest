import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/components/app_text.dart';
import '../../../../widgets/components/app_text_field.dart';
import '../../../../widgets/components/gaps.dart';

class PasswordResetBodyContent extends StatefulWidget {
  const PasswordResetBodyContent({super.key});

  @override
  State<PasswordResetBodyContent> createState() =>
      _PasswordResetBodyContentState();
}

class _PasswordResetBodyContentState extends State<PasswordResetBodyContent> {
  // Email controller
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGaps.gap4h(),
        AppText(
          'Recuperar Cuenta',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        AppGaps.gap4h(),
        AppTextField(
          controller: _emailController,
          hintText: "Email",
          prefixIcon: Icons.email_outlined,
          fieldType: TextInputType.emailAddress,
        ),
        AppGaps.gap2h(),

        SizedBox(
          width: 90.w,
          height: 6.h,
          child: ElevatedButton(
            onPressed: () {
              context.push('/passwordChange');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  "Reestablecer",
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                AppGaps.gap2w(),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.white,
                  size: 18.sp,
                ),
              ],
            ),
          ),
        ),
        AppGaps.gap2h(),
        GestureDetector(
          onTap: () {
            context.pushReplacement('/signUp');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText("¿No tienes una cuenta? ", fontWeight: FontWeight.normal),
              AppText(
                "Crear una nueva cuenta",
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
        AppGaps.gap4h(),
      ],
    );
  }
}
