import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/divider.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';
import 'package:insight_artistry_updated/core/widgets/heading.dart';
import 'package:insight_artistry_updated/core/widgets/sub_heading.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../core/widgets/button.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: SizeConfig.width(context, 1),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.height(context, 0.7),
                width: SizeConfig.width(context, 1),
                child: Image.asset(
                  'assets/images/onboarding1.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              buildVerticalDivider(context, 0.04),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.04),
                  ),
                  child: const HeadingTextWidget(text: "Buy & Enjoy",)
              ),
              buildVerticalDivider(context, 0.02),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.04),
                  ),
                  child: const SubHeadingTextWidget(text:"Simple and secure shopping at your fingertips.",)
              ),
              buildVerticalDivider(context, 0.02),

              ButtonWidget(
                  marginWidth: SizeConfig.width(context, 0.07),
                  onTab: () {
                    Navigator.pushNamed(context, AppRoute.loginScreen);
                  },
                  text: "Get Started"),
            ],
          )),
    );
  }
}
