import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/src/presentation/views/cart_screen/cart_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/favorite_screen/favorite_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/home_screen/home_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/notification_screen/notification_screen.dart';
import 'package:insight_artistry_updated/src/presentation/views/profile_screen/profile_screen.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/size_config.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int visit = 2; // Set initial tab index to "Home"

  List<Widget> _screens = [
    const NotificationScreen(),
    const FavoriteScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  List<TabItem> items = [
    const TabItem(
      icon: Icons.notifications_none_sharp,
      title: 'Notification',
    ),
    const TabItem(
      icon: Icons.favorite_border_sharp,
      title: 'Favorite',
    ),
    const TabItem(
      icon: Icons.home_outlined,
      title: 'Home',
    ),
    const TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    const TabItem(
      icon: Icons.account_box,
      title: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[visit],
      bottomNavigationBar: BottomBarFloating(
        iconSize: SizeConfig.width(context, 0.07),
        items: items,
        backgroundColor: Colors.white,
        color: GlobalColor.head2TextColor,
        colorSelected: GlobalColor.head2TextColor,
        indexSelected: visit,
        // paddingVertical: SizeConfig.height(context, 0.02),
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
