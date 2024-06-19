import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/colors.dart';

import '../../../core/constant/size_config.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTab,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.marginWidth,
    this.marginHeight,
    this.height,
    this.btnColor,
    this.radiusWidth,
  });

  final VoidCallback onTab;
  final String text;
  final double? fontSize;
  final double? width;
  final double? radiusWidth;
  final double? marginWidth;
  final double? height;
  final double? marginHeight;
  final FontWeight? fontWeight;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.width(context, 1),
      height: height ?? SizeConfig.height(context, 0.07),
      margin: EdgeInsets.symmetric(
        vertical: marginHeight ?? SizeConfig.height(context, 0.02),
        horizontal: marginWidth ?? SizeConfig.width(context, 0.02),
      ),
      decoration: BoxDecoration(
        color: btnColor ?? GlobalColor.btnColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radiusWidth ?? SizeConfig.width(context, 0.08)),
        ),
      ),
      child: TextButton(
        onPressed: onTab,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? SizeConfig.width(context, 0.05),
            fontWeight: fontWeight ?? FontWeight.w500,
            color: Colors.white, // Ensure text color is set
          ),
        ),
      ),
    );

  }
}
