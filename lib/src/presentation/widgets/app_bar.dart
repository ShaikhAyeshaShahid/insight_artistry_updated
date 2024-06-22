import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';

import '../../../constant/colors.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, this.icon});

  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: SizeConfig.width(context, 0.06),
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: GlobalColor.head2TextColor,
            size: SizeConfig.width(context, 0.07),
          ),
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: SizeConfig.width(context, 0.06),
          child: Icon(
            icon ?? Icons.favorite_border_sharp,
            color: GlobalColor.head2TextColor,
            size: SizeConfig.width(context, 0.07),
          ),
          backgroundColor: Colors.white,
        )
      ],
    );
  }
}
