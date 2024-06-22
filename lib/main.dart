import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/src/presentation/views/home_screen/home_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/login_signup_screens/login_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/login_signup_screens/signup_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/onboarding_screens/onboarding_screens_1.dart';
import 'package:insight_artistry_updated/src/presentation/views/onboarding_screens/onboarding_screens_2.dart';
import 'package:insight_artistry_updated/src/presentation/views/onboarding_screens/onboarding_screens_3.dart';
import 'package:insight_artistry_updated/src/presentation/views/product_display_screen/product_display_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/splash_screen.dart';

import 'app/routes/app_route.dart';
import 'core/constant/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: GlobalColor.bgColor),
          useMaterial3: true,
          fontFamily: 'Montserrat'),
      home: const SplashScreen(),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route? _onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == AppRoute.splashScreen) {
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
    if (routeSettings.name == AppRoute.onboardingScreen1) {
      return MaterialPageRoute(builder: (context) => const OnboardingScreen1());
    }
    if (routeSettings.name == AppRoute.onboardingScreen2) {
      return MaterialPageRoute(builder: (context) => const OnboardingScreen2());
    }
    if (routeSettings.name == AppRoute.onboardingScreen3) {
      return MaterialPageRoute(builder: (context) => const OnboardingScreen3());
    }
    if (routeSettings.name == AppRoute.loginScreen) {
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
    if (routeSettings.name == AppRoute.signUpScreen) {
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    }
    if (routeSettings.name == AppRoute.homeScreen) {
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
    if (routeSettings.name == AppRoute.productDisplayScreen) {
      return MaterialPageRoute(builder: (context) => const ProductDisplayScreen());
    }
    assert(false, 'Need to implement ${routeSettings.name}');
    return null;
  }
}
