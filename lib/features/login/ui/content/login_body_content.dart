import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/app_toast.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/image_path.dart';
import '../../../../widgets/components/buttons/animated_background_button.dart';
import '../../../../widgets/components/app_text.dart';
import '../../../../widgets/components/app_text_field.dart';
import '../../../../widgets/components/gaps.dart';
import '../../domain/models/login.dart';
import '../../providers/login_provider.dart';

class LoginBodyContent extends ConsumerStatefulWidget {
  const LoginBodyContent({super.key});
  @override
  ConsumerState<LoginBodyContent> createState() => _LoginBodyContentState();
}

class _LoginBodyContentState extends ConsumerState<LoginBodyContent> {
  // Text cotrollers for each textfield
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInNotifierProvider);
    final googleState = ref.watch(googleSignInNotifierProvider);

    // Escucha cambios para navegar o mostrar error
    ref.listen<AsyncValue<void>>(signInNotifierProvider, (prev, next) {
      next.when(
        data: (_) {
          context.push('/dashboard');
        },
        loading: () {},
        error: (e, _) {
          final msg = (e is Exception) ? e.toString() : 'Error desconocido';
          AppToast.show(
            context: context,
            message: msg,
            type: AppToastType.warning,
          );
        },
      );
    });

    // Listener Google
    ref.listen<AsyncValue<void>>(googleSignInNotifierProvider, (_, next) {
      next.when(
        data: (_) => context.push('/dashboard'),
        loading: () {},
        error: (e, _) {
          AppToast.show(
            context: context,
            message: e.toString(),
            type: AppToastType.warning,
          );
          log(e.toString());
        },
      );
    });
    return Column(
      children: [
        AppGaps.gap4h(),
        // Screen title
        AppText("Iniciar Sesión", fontSize: 20.sp, fontWeight: FontWeight.bold),
        AppGaps.gap4h(),

        // Email field
        AppTextField(
          controller: _emailController,
          hintText: "Email",
          prefixIcon: Icons.alternate_email_rounded,
          fieldType: TextInputType.emailAddress,
        ),
        AppGaps.gap2h(),

        // Pass field
        AppTextField(
          controller: _passwordController,
          hintText: "Contraseña",
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
          fieldType: TextInputType.visiblePassword,
        ),
        AppGaps.gap2h(),

        // login button
        AnimatedBackgroundButton(
          onPressed:
              signInState.isLoading
                  ? null
                  : () {
                    final params = LoginParams(
                      email: _emailController.text.trim(),
                      password: _passwordController.text,
                    );
                    ref.read(signInNotifierProvider.notifier).signIn(params);
                  },
          text: signInState.isLoading ? 'Ingresando...' : 'Iniciar sesión',
        ),
        AppGaps.gap2h(),

        // Redirect to sign up
        GestureDetector(
          onTap: () {
            context.push('/signUp');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText("¿No tienes una cuenta? ", fontWeight: FontWeight.normal),
              AppText(
                "Crea una cuenta nueva",
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Divider(),
        ),
        // Redirect to sign up
        GestureDetector(
          onTap: () {
            context.push('/passwordReset');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                "¿Olvidaste tu contraseña? ",
                fontWeight: FontWeight.normal,
              ),
              AppText(
                "Recupera tu cuenta",
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
        AppGaps.gap4h(),
        // login with Apple button
        if (Platform.isIOS)
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 90.w,
              height: 5.5.h,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.lightPlusGrey,
                  width: 0.5.w,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage(ImagePath.appleLogo), width: 7.w),
                  AppGaps.gap2w(),
                  AppText(
                    'Inicar sesión con Apple ID',
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        AppGaps.gap2h(),
        // login with google button
        GestureDetector(
          onTap:
              googleState.isLoading
                  ? null
                  : () =>
                      ref
                          .read(googleSignInNotifierProvider.notifier)
                          .signInWithGoogle(),
          child: Container(
            width: 90.w,
            height: 5.5.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.lightPlusGrey, width: 0.5.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagePath.googleLogo, width: 6.w),
                AppGaps.gap2w(),
                AppText(
                  'Iniciar sesión con Google',
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
        AppGaps.gap2h(),
        // login with google button
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 90.w,
            height: 5.5.h,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.lightPlusGrey, width: 0.5.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(ImagePath.facebookLogo)),
                AppGaps.gap2w(),
                AppText(
                  'Inicar sesión con Faceboock',
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
