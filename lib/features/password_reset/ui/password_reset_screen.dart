import 'package:flutter/material.dart';

import '../../../widgets/app_logo_auth_section.dart';
import '../../../widgets/app_scafold.dart';
import 'content/password_reset_body_content.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [AppLogoAuthSection(), PasswordResetBodyContent()],
      ),
    );
  }
}
