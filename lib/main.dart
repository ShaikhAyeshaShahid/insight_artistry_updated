import 'package:flutter/material.dart';
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
        fontFamily: 'Montserrat'
      ),
      home: const SplashScreen(),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route? _onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == AppRoute.splashScreen) {
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
    assert(false, 'Need to implement ${routeSettings.name}');
    return null;
  }
}
