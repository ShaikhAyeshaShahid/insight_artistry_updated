import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/divider.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';
import 'package:insight_artistry_updated/core/widgets/heading.dart';
import 'package:insight_artistry_updated/core/widgets/sub_heading.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../constant/colors.dart';
import '../../../../core/widgets/button.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.bgColor,
      body: Container(
          width: SizeConfig.width(context, 1),
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
                  horizontal: SizeConfig.width(context, 0.05),
                ),
                child: const HeadingTextWidget(text: "Welcome to Insight Artistry", fontWeight: FontWeight.w900,)
              ),
              buildVerticalDivider(context, 0.02),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context, 0.05),
                ),
                child: const SubHeadingTextWidget(text:"Explore a world of unique and exquisite artworks.",)
              ),
              buildVerticalDivider(context, 0.02),

              ButtonWidget(
                  marginWidth: SizeConfig.width(context, 0.07),
                  onTab: () {
                    Navigator.pushNamed(context, AppRoute.onboardingScreen2);
                  },
                  text: "Next"),
            ],
          )),
    );
  }
}
