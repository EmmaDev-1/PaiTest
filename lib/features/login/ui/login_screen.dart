import 'package:flutter/material.dart';

import '../../../widgets/app_logo_auth_section.dart';
import '../../../widgets/app_scafold.dart';
import 'content/login_body_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(children: [AppLogoAuthSection(), LoginBodyContent()]),
    );
  }
}
