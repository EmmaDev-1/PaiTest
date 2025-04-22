import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// A centralized class for common spacing gaps used throughout the app.
///
/// This class provides static methods that return responsive SizedBoxes
/// using Sizer extensions (.w for width and .h for height).
///
/// Example:
///   AppGaps.gap8w()  // Returns a SizedBox with width equal to 8% of screen width.
class AppGaps {
  // Horizontal gaps
  static Widget gap2w() => SizedBox(width: 2.w);
  static Widget gap4w() => SizedBox(width: 4.w);
  static Widget gap6w() => SizedBox(width: 6.w);
  static Widget gap8w() => SizedBox(width: 8.w);
  static Widget gap10w() => SizedBox(width: 10.w);
  static Widget gap12w() => SizedBox(width: 12.w);
  static Widget gap14w() => SizedBox(width: 14.w);
  static Widget gap16w() => SizedBox(width: 16.w);
  static Widget gap18w() => SizedBox(width: 18.w);
  static Widget gap20w() => SizedBox(width: 20.w);
  static Widget gap22w() => SizedBox(width: 22.w);
  static Widget gap24w() => SizedBox(width: 24.w);
  static Widget gap26w() => SizedBox(width: 26.w);
  static Widget gap28w() => SizedBox(width: 28.w);
  static Widget gap30w() => SizedBox(width: 30.w);

  // Vertical gaps
  static Widget gap1h() => SizedBox(height: 1.h);
  static Widget gap2h() => SizedBox(height: 2.h);
  static Widget gap4h() => SizedBox(height: 4.h);
  static Widget gap6h() => SizedBox(height: 6.h);
  static Widget gap8h() => SizedBox(height: 8.h);
  static Widget gap10h() => SizedBox(height: 10.h);
  static Widget gap12h() => SizedBox(height: 12.h);
  static Widget gap14h() => SizedBox(height: 14.h);
  static Widget gap16h() => SizedBox(height: 16.h);
  static Widget gap18h() => SizedBox(height: 18.h);
  static Widget gap20h() => SizedBox(height: 20.h);
  static Widget gap22h() => SizedBox(height: 22.h);
  static Widget gap24h() => SizedBox(height: 24.h);
  static Widget gap26h() => SizedBox(height: 26.h);
  static Widget gap28h() => SizedBox(height: 28.h);
  static Widget gap30h() => SizedBox(height: 30.h);
  static Widget gap32h() => SizedBox(height: 32.h);
  static Widget gap34h() => SizedBox(height: 34.h);
  static Widget gap36h() => SizedBox(height: 36.h);
  static Widget gap38h() => SizedBox(height: 38.h);
  static Widget gap40h() => SizedBox(height: 40.h);
  static Widget gap50h() => SizedBox(height: 50.h);
  static Widget gap60h() => SizedBox(height: 60.h);
}
