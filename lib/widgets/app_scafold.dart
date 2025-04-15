import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';

/// A customizable scaffold widget that provides a consistent design for
/// the application's screens. It includes default background color, a safe
/// area, and responsive horizontal padding. Optionally, you can provide an
/// appBar, drawer, and bottomNavigationBar.
class AppScaffold extends StatelessWidget {
  /// An optional app bar widget.
  final PreferredSizeWidget? appBar;

  /// An optional drawer widget.
  final Widget? drawer;

  /// An optional bottom navigation bar widget.
  final Widget? bottomNavigationBar;

  /// The main body content of the screen.
  final Widget body;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// Optional padding to override the default horizontal padding.
  final EdgeInsetsGeometry? padding;

  const AppScaffold({
    super.key,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    required this.body,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w),
            child: body,
          ),
        ),
      ),
    );
  }
}
