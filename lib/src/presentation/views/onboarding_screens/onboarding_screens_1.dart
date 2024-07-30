import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/divider.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';
import 'package:insight_artistry_updated/core/widgets/heading.dart';
import 'package:insight_artistry_updated/core/widgets/sub_heading.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../constant/colors.dart';
import '../../../../core/widgets/button.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.bgColor,
      body: Container(
          width: SizeConfig.width(context, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: [
                      Image.asset(
                        'assets/images/onboarding1.jpg',
                        fit: BoxFit.cover,
                        width: SizeConfig.width(context, 1),
                      ),
                      Image.asset(
                        'assets/images/onboarding2.jpg',
                        fit: BoxFit.cover,
                        width: SizeConfig.width(context, 1),
                      ),
                      Image.asset(
                        'assets/images/onboarding3.jpg',
                        fit: BoxFit.cover,
                        width: SizeConfig.width(context, 1),
                      ),
                    ],
                    options: CarouselOptions(
                      height: SizeConfig.height(context, 0.75),
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                      viewportFraction: 1,
                      padEnds: false,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          currentIndex = index;
                          // LogManager.info('currentIndex = $currentIndex');
                        });
                      },
                    ),
                    disableGesture: true,
                  ),
                ],
              ),
              buildVerticalDivider(context, 0.02),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.05),
                  ),
                  child: const HeadingTextWidget(
                    text: "Welcome to Insight Artistry",
                    fontWeight: FontWeight.w900,
                  )),
              buildVerticalDivider(context, 0.02),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.05),
                  ),
                  child: const SubHeadingTextWidget(
                    text: "Explore a world of unique and exquisite artworks.",
                  )),
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
