import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/utils/app_toast.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/components/buttons/animated_background_button.dart';
import '../../../../widgets/components/app_text.dart';
import '../../../../widgets/components/app_text_field.dart';
import '../../../../widgets/components/gaps.dart';
import '../../domain/models/sign_up.dart';
import '../../providers/auth_provider.dart';

class SignUpBodyContent extends ConsumerStatefulWidget {
  const SignUpBodyContent({super.key});
  @override
  ConsumerState<SignUpBodyContent> createState() => _SignUpBodyContentState();
}

class _SignUpBodyContentState extends ConsumerState<SignUpBodyContent> {
  // Text field controllers
  final _usernameController = TextEditingController();
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpNotifierProvider);

    ref.listen<AsyncValue<void>>(signUpNotifierProvider, (prev, next) {
      next.when(
        data: (_) {
          // registro exitoso → navegar o mostrar mensaje
          context.go('/dashboard');
          AppToast.show(
            context: context,
            message: 'Cuenta creada',
            type: AppToastType.success,
          );
        },
        error: (e, _) {
          final msg = e is Exception ? e.toString() : 'Error desconocido';
          AppToast.show(
            context: context,
            message: msg,
            type: AppToastType.warning,
          );
        },
        loading: () {},
      );
    });
    return Column(
      children: [
        AppGaps.gap4h(),
        // Screen title
        AppText("Crear cuenta", fontSize: 20.sp, fontWeight: FontWeight.bold),
        AppGaps.gap4h(),
        // Username Field
        AppTextField(
          controller: _usernameController,
          hintText: "Username",
          prefixIcon: Icons.alternate_email_rounded,
          fieldType: TextInputType.text,
        ),
        AppGaps.gap2h(),

        // Name Field
        AppTextField(
          controller: _nombreController,
          hintText: "Nombre",
          prefixIcon: Icons.person_outline_rounded,
          fieldType: TextInputType.name,
        ),
        AppGaps.gap2h(),

        // Email Field
        AppTextField(
          controller: _emailController,
          hintText: "Email",
          prefixIcon: Icons.email_outlined,
          fieldType: TextInputType.emailAddress,
        ),
        AppGaps.gap2h(),

        // Phone Field
        AppTextField(
          controller: _telefonoController,
          hintText: "Teléfono",
          prefixIcon: Icons.phone_outlined,
          fieldType: TextInputType.phone,
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

        // Verify pass field
        AppTextField(
          controller: _verifyPasswordController,
          hintText: "Verificar contraseña",
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
          fieldType: TextInputType.visiblePassword,
        ),
        AppGaps.gap2h(),

        // sign up button
        AnimatedBackgroundButton(
          onPressed:
              signUpState.isLoading
                  ? null
                  : () {
                    if (_passwordController.text !=
                        _verifyPasswordController.text) {
                      AppToast.show(
                        context: context,
                        message: 'Las contraseñas no coinciden',
                        type: AppToastType.warning,
                      );
                      return;
                    }
                    final params = SignUpParams(
                      username: _usernameController.text,
                      name: _nombreController.text,
                      email: _emailController.text,
                      phone: _telefonoController.text,
                      password: _passwordController.text,
                    );
                    ref.read(signUpNotifierProvider.notifier).signUp(params);
                  },
          text: signUpState.isLoading ? 'Creando...' : 'Crear una cuenta',
        ),
        AppGaps.gap2h(),

        // Return to login
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText("¿Ya tienes cuenta? ", fontWeight: FontWeight.normal),
              AppText(
                "Inicia Sesión",
                fontWeight: FontWeight.bold,
                color: AppColors.accent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
