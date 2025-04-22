import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDirection;
  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;

  const AppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.maxLines,
    this.overflow,
    this.strutStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Default style
    final defaultTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );

    // Default properties are overwritten with those received
    final effectiveStyle = defaultTextStyle.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDirection,
    );

    return Text(
      data,
      style: effectiveStyle,
      textAlign: textAlign,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      strutStyle: strutStyle,
    );
  }
}
