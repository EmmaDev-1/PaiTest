import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../utils/colors.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType fieldType;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
    this.prefixIcon,
    this.suffixIcon,
    required this.fieldType,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;
  bool _showToggle = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    if (widget.obscureText) {
      widget.controller.addListener(_updateToggleVisibility);
    }
  }

  void _updateToggleVisibility() {
    final hasText = widget.controller.text.isNotEmpty;
    if (hasText != _showToggle) {
      setState(() {
        _showToggle = hasText;
      });
    }
  }

  @override
  void dispose() {
    if (widget.obscureText) {
      widget.controller.removeListener(_updateToggleVisibility);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.mediumGrey.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 8,
            offset: const Offset(0, 0.2),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(
          color: AppColors.black,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        controller: widget.controller,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        keyboardType: widget.fieldType,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: AppColors.lightPlusGrey,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: AppColors.accent.withOpacity(0.4),
              width: 2,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w800,
            color: AppColors.mediumGrey,
          ),
          contentPadding: EdgeInsets.all(2.h),
          prefixIcon:
              widget.prefixIcon != null
                  ? Icon(
                    widget.prefixIcon,
                    size: 18.sp,
                    color: AppColors.mediumGrey,
                  )
                  : null,
          suffixIcon:
              widget.suffixIcon ??
              (widget.obscureText
                  ? (_showToggle
                      ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18.sp,
                          color: AppColors.mediumGrey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                      : null)
                  : null),
        ),
      ),
    );
  }
}
