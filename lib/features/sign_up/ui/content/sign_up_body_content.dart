import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/colors.dart';
import '../../../../widgets/components/buttons/animated_background_button.dart';
import '../../../../widgets/components/app_text.dart';
import '../../../../widgets/components/app_text_field.dart';
import '../../../../widgets/components/gaps.dart';

class SignUpBodyContent extends StatefulWidget {
  const SignUpBodyContent({super.key});

  @override
  State<SignUpBodyContent> createState() => _SignUpBodyContentState();
}

class _SignUpBodyContentState extends State<SignUpBodyContent> {
  // Text field controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            context.push('/otpCode');
          },
          text: "Crear una cuenta",
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
        AppGaps.gap4h(),
      ],
    );
  }
}
