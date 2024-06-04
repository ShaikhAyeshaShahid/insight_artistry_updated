import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/colors.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';
import 'package:insight_artistry_updated/constant/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.height(context, 1),
            width: SizeConfig.width(context, 1),
            color: GlobalColor.bgColor,
          ),
          Column(
            children: [
              SizedBox(
                height: SizeConfig.height(context, 0.1),
              ),
              Text(
                StringConstant.tagLine,
                style: TextStyle(
                    fontSize: SizeConfig.width(context, 0.1),
                    fontWeight: FontWeight.w700, color: GlobalColor.headTextColor),
              ),
              Text(
                StringConstant.appName,
                style: TextStyle(
                    fontSize: SizeConfig.width(context, 0.1),
                    fontWeight: FontWeight.w700, color: GlobalColor.textColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
