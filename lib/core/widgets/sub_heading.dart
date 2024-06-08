import 'package:flutter/material.dart';

import '../../constant/colors.dart';
import '../../constant/size_config.dart';
class SubHeadingTextWidget extends StatelessWidget {
  const SubHeadingTextWidget({super.key,required  this.text,
    this.fontSize,
    this.fontWeight,
    this.color});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,  style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? SizeConfig.width(context, 0.03),
        color: color ?? GlobalColor.textColor),
    );
  }
}
