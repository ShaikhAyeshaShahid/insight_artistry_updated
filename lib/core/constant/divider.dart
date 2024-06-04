import 'package:flutter/cupertino.dart';
import 'package:insight_artistry_updated/core/constant/size_config.dart';

SizedBox buildVerticalDivider(BuildContext context, double fraction) =>
    SizedBox(height: SizeConfig.height(context, fraction));

SizedBox buildHorizontalDivider(BuildContext context, double fraction) =>
    SizedBox(width: SizeConfig.width(context, fraction));