import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "./theme.dart";

class AppTextField extends StatelessWidget {
  final String? hintText, labelText;
  final TextInputType? textInputType;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines, maxLength;
  final int hintSize, fontSize;
  final double width;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.hintText,
    this.hintSize = 16,
    this.fontSize = 16,
    this.width = 0,
    this.textInputType,
    this.onChanged,
    this.labelText,
    this.controller,
    this.maxLines = 1,
    this.onTap,
    this.focusNode,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    var text = TextFormField(
      cursorColor: AppColorPallete.black.withOpacity(0.4),
      cursorWidth: 1.h,
      focusNode: focusNode,
      maxLines: maxLines,
      maxLength: maxLength,
      style: TextStyle(
        color: AppColorPallete.black,
        fontSize: fontSize.sp,
        letterSpacing: 1.8,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.all(5.h),
        filled: true,
        fillColor: const Color(0xffF4F4F4),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColorPallete.grey,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontSize: hintSize.sp,
          letterSpacing: 0.1,
        ),
        errorStyle: TextStyle(
          color: AppColorPallete.red,
          fontSize: 12.5.sp,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorPallete.grey,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(4.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorPallete.primary,
            width: 0.3.h,
          ),
          borderRadius: BorderRadius.circular(4.h),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorPallete.red,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(4.h),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorPallete.red,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(4.h),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorPallete.grey.withOpacity(0.2),
            width: 0.5.h,
          ),
          borderRadius: BorderRadius.circular(4.h),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorPallete.grey,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(4.h),
        ),
      ),
      onTap: onTap,
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
    );

    return Container(
        margin: EdgeInsets.only(bottom: 5.r),
        child: width > 0
            ? SizedBox(
                width: width,
                child: text,
              )
            : text);
  }
}
