import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/components/app_text.dart';
import '../../../../widgets/components/app_text_field.dart';
import '../../../../widgets/components/gaps.dart';

class ChangePasswordBodyContent extends StatefulWidget {
  const ChangePasswordBodyContent({super.key});

  @override
  State<ChangePasswordBodyContent> createState() =>
      _ChangePasswordBodyContentState();
}

class _ChangePasswordBodyContentState extends State<ChangePasswordBodyContent> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          'Cambiar Contraseña',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        AppGaps.gap4h(),
        // Campo Email
        // Campo Contraseña
        AppTextField(
          controller: _passwordController,
          hintText: "Nueva contraseña",
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
          fieldType: TextInputType.visiblePassword,
        ),
        AppGaps.gap2h(),

        // Campo Verificar Contraseña
        AppTextField(
          controller: _verifyPasswordController,
          hintText: "Verificar nueva contraseña",
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
          fieldType: TextInputType.visiblePassword,
        ),
        AppGaps.gap2h(),

        // Botón para crear cuenta
        SizedBox(
          width: 90.w,
          height: 6.h,
          child: ElevatedButton(
            onPressed: () {
              context.push('/login');
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
                  "Cambiar contraseña",
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
        AppGaps.gap4h(),
      ],
    );
  }
}
