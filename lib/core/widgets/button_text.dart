import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/size_config.dart';
class ButtonTextWidget extends StatelessWidget {
  const ButtonTextWidget({super.key,required  this.text,
    this.fontSize,
    this.fontWeight,
    this.color});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? SizeConfig.width(context, 0.04),
        fontWeight: fontWeight ?? FontWeight.w600,
        color: Colors.white, // Ensure text color is set
      ),
    );
  }
}
