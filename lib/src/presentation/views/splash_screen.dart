import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../app/routes/app_route.dart';
import '../../../constant/colors.dart';
import '../../../constant/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed)
        {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
    });
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, AppRoute.dashboardScreen);
        // Navigator.pushReplacementNamed(context, AppRoute.onboardingScreen1);
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
