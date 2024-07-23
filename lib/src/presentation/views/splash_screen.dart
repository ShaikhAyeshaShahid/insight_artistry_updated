import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../app/routes/app_route.dart';
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
        // Navigator.pushReplacementNamed(context, AppRoute.dashboardScreen);
        Navigator.pushReplacementNamed(context, AppRoute.onboardingScreen1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: SizeConfig.height(context, 1),
        width: SizeConfig.width(context, 1),
        color: GlobalColor.bgColor,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
