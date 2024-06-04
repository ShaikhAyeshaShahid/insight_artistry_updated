import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/size_config.dart';
import '../../../core/constant/string.dart';
import 'login_signup_screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.height(context, 1),
            width: SizeConfig.width(context, 1),
            color: GlobalColor.bgColor,
            child: Image.asset(
              'assets/images/background_img.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // vertical
              crossAxisAlignment: CrossAxisAlignment.start, // horizontal
              children: [
                SizedBox(height: SizeConfig.height(context, 0.1)),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.width(context, 0.02),
                    top: SizeConfig.height(context, 0.3),
                  ),
                  child: Text(
                    StringConstant.appName,
                    style: TextStyle(
                      fontSize: SizeConfig.width(context, 0.1),
                      fontWeight: FontWeight.w800,
                      color: GlobalColor.headTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.width(context, 0.02),
                      top: SizeConfig.height(context, 0.02)),
                  child: Text(
                    StringConstant.tagLine,
                    style: TextStyle(
                        fontSize: SizeConfig.width(context, 0.05),
                        fontWeight: FontWeight.w700,
                        color: GlobalColor.textColor,
                        decorationStyle: TextDecorationStyle.wavy),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
