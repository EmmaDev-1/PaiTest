import 'package:flutter/material.dart';

import '../../../widgets/app_logo_auth_section.dart';
import '../../../widgets/app_scafold.dart';
import 'content/sign_up_body_content.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(children: [AppLogoAuthSection(), SignUpBodyContent()]),
    );
  }
}
