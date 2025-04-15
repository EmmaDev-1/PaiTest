import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/colors.dart';
import '../../../widgets/app_logo_auth_section.dart';
import '../../../widgets/app_scafold.dart';
import '../../../widgets/components/app_text.dart';
import '../../../widgets/components/gaps.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppGaps.gap4h(),
            AppLogoAuthSection(),
            AppGaps.gap4h(),
            otpCodeScreenContent(),
            AppGaps.gap4h(),
          ],
        ),
      ),
    );
  }

  otpCodeScreenContent() {
    final defaultPinTheme = PinTheme(
      width: 12.w,
      height: 6.h,
      textStyle: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return Column(
      children: [
        AppText(
          "Código de verificación",
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        AppGaps.gap4h(),
        // Subtítulo
        AppText(
          "Hemos enviado un código de verificación a tu email, por favor verifícalo e ingrésalo.",
          fontSize: 15.sp,
          color: AppColors.mediumGrey,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
        AppGaps.gap4h(),
        // Widget Pinput para ingresar los 6 dígitos
        Pinput(
          controller: _otpController,
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.greenSeafoam, width: 2),
            ),
          ),
          onCompleted: (pin) {
            // Aquí se maneja el código ingresado
            print("OTP ingresado: $pin");
          },
        ),
        AppGaps.gap2h(),
        // Mostrar mensajes o estado del OTP en la UI
        //if (otpState.status == OtpStatus.error)
        AppText(
          "Error",
          fontSize: 13.sp,
          color: AppColors.red,
          fontWeight: FontWeight.w500,
        ),
        AppGaps.gap2h(),
        // Se omite el temporizador en este ejemplo
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, color: AppColors.mediumGrey, size: 14.sp),
            AppText(
              '(número)sg',
              color: AppColors.mediumGrey,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Ejemplo: solicitar un nuevo OTP y reiniciar el temporizador
          },
          child: AppText(
            "Solicitar nuevamente",
            color: AppColors.accent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
