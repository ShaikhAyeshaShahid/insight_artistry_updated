import 'package:flutter/cupertino.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';

SizedBox buildVerticalDivider(BuildContext context, double? fraction) =>
    SizedBox(
      height: SizeConfig.height(context, fraction ?? 0.02) ??
          SizeConfig.height(context, 0.02),
    );

SizedBox buildHorizontalDivider(BuildContext context, double? fraction) =>
    SizedBox(
      width: SizeConfig.width(context, fraction ?? 0.02) ??
          SizeConfig.width(context, 0.02),
    );
