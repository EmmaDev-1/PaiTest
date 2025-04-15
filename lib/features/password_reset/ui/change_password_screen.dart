import 'package:flutter/material.dart';

import '../../../widgets/app_logo_auth_section.dart';
import '../../../widgets/app_scafold.dart';
import '../../../widgets/components/gaps.dart';
import 'content/change_password_body_content.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          AppGaps.gap4h(),
          AppLogoAuthSection(),
          AppGaps.gap4h(),
          ChangePasswordBodyContent(),
        ],
      ),
    );
  }
}
