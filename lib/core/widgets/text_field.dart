import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/size_config.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.obscureText,
    this.autovalidateMode,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.marginWidth,
    this.marginHeight,
    this.btnColor,
    this.radiusWidth,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.icon,
    required this.isSuffixIcon,
    required this.readOnly,
  });

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  bool obscureText = false;
  AutovalidateMode? autovalidateMode;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? marginWidth;
  final double? marginHeight;
  final Color? btnColor;
  final double? radiusWidth;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  bool icon = false;
  bool isSuffixIcon = false;
  bool readOnly = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.width(context, 0.05),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.05)),
          borderSide: BorderSide(color: GlobalColor.borderTextColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.05)),
          borderSide: BorderSide(
              color: GlobalColor.headTextColor), // Customize the border color
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.05)),
          borderSide: const BorderSide(color: Colors.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.05)),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        hintText: hint ?? "",
        prefixIcon: icon ? prefixIcon ?? const Icon(Icons.person) : null,
        suffixIcon: isSuffixIcon
            ? suffixIcon ?? /*obscureText?Icon(Icons.remove_red_eye_outlined,color: GlobalColor.headTextColor,) :*/
                const Icon(Icons.remove_red_eye_outlined)
            : null,
      ),
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: fontSize ?? SizeConfig.width(context, 0.04),
          color: color ?? GlobalColor.textColor),
    );
  }
}
