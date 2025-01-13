import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final List<TextInputFormatter> formatter;
  final Function(String updateText)? onChange;
  final String hintText;
  final bool isEnabled;
  final int maxLength;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.isEnabled = true,
    this.formatter = const [],
    this.onChange,
    this.maxLength = 10000,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      width: double.infinity,
      height: 35.h,
      decoration: BoxDecoration(
        color: AppColors.primaryLightColor.withOpacity(0.1),
        border: Border.all(width: 1.h, color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        inputFormatters: formatter,
        enabled: isEnabled,
        obscureText: hintText.contains('Password'),
        onChanged: onChange,
        maxLength: maxLength,
        style: const TextStyle(color: AppColors.blackColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.blackColor),
          counterText: '',
        ),
      ),
    );
  }
}