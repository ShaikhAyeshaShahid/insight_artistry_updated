import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/divider.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';
import 'package:insight_artistry_updated/core/widgets/heading.dart';
import 'package:insight_artistry_updated/core/widgets/sub_heading.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../core/widgets/button.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
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
                  child: const HeadingTextWidget(text: "Discover Unique Artworks",)
              ),
              buildVerticalDivider(context, 0.02),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.04),
                  ),
                  child: const SubHeadingTextWidget(text:"Find pieces that speak to your soul and style.",)
              ),
              buildVerticalDivider(context, 0.02),

              ButtonWidget(
                  marginWidth: SizeConfig.width(context, 0.07),
                  onTab: () {
                    Navigator.pushNamed(context, AppRoute.onboardingScreen3);
                  },
                  text: "Next"),
            ],
          )),
    );
  }
}
