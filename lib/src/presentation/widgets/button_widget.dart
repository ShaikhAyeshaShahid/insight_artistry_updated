import 'package:flutter/material.dart';

import '../../../core/constant/size_config.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.onTab,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.width,
      this.height});

  final VoidCallback onTab;
  final String text;
  final double? fontSize;
  final double? width;
  final double? height;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.width(context, 1),
      height: height ?? SizeConfig.height(context, 0.05),
      child: ElevatedButton(
        onPressed: onTab,
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize ?? 0.02,
              fontWeight: fontWeight ?? FontWeight.normal),
        ),
      ),
    );
  }
}
