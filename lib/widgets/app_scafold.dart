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

  /// An optional floating action button.
  final Widget? floatingActionButton;

  /// An optional location for the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// An optional animator for the floating action button.
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// An optional bottom navigation bar widget.
  final Widget? bottomNavigationBar;

  /// The main body content of the screen.
  final Widget body;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// Optional padding to override the default horizontal padding.
  final EdgeInsetsGeometry? padding;

  /// Is the content scrollable.
  final bool? isScrollable;

  const AppScaffold({
    super.key,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.bottomNavigationBar,
    required this.body,
    this.backgroundColor,
    this.padding,
    this.isScrollable,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor ?? AppColors.white,
      body: SafeArea(
        child:
            isScrollable == false
                ? Padding(
                  padding: padding ?? EdgeInsets.symmetric(horizontal: 6.w),
                  child: body,
                )
                : SingleChildScrollView(
                  child: Padding(
                    padding: padding ?? EdgeInsets.symmetric(horizontal: 6.w),
                    child: body,
                  ),
                ),
      ),
    );
  }
}
