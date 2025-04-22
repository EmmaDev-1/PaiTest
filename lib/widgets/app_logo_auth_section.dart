import 'package:flutter/material.dart';
import 'package:pai/widgets/components/gaps.dart';
import 'package:sizer/sizer.dart';

import '../utils/image_path.dart';

class AppLogoAuthSection extends StatelessWidget {
  const AppLogoAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGaps.gap4h(),
        Image(image: AssetImage(ImagePath.appLogo), width: 26.w),
      ],
    );
  }
}
