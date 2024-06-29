import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';

import '../../../constant/colors.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    super.key,
    this.icon,
    this.text,
  });

  IconData? icon;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            radius: SizeConfig.width(context, 0.06),
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: GlobalColor.head2TextColor,
              size: SizeConfig.width(context, 0.07),
            ),
          ),
        ),
        Text(
          text ?? "",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: SizeConfig.width(context, 0.06),
              color: GlobalColor.head2TextColor),
          textAlign: TextAlign.center,
        ),
        CircleAvatar(
          radius: SizeConfig.width(context, 0.06),
          backgroundColor: Colors.white,
          child: Icon(
            icon ?? Icons.favorite_border_sharp,
            color: GlobalColor.head2TextColor,
            size: SizeConfig.width(context, 0.07),
          ),
        )
      ],
    );
  }
}
