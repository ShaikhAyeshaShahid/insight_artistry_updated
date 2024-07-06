import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/core/widgets/heading.dart';
import 'package:insight_artistry_updated/core/widgets/sub_heading.dart';
import 'package:insight_artistry_updated/src/presentation/widgets/app_bar.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/size_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String>  _options1 = [
    "Settings",
    "Notifications",
    "Older History",
  ];
  List<String> _options2 = [
    "Privacy & Policy",
    "Terms & Conditions",
    "Log Out"
  ];

  List<String> _Images1 =[
    "assets/images/profile_icons/setting_icon.png",
    "assets/images/profile_icons/bell.png",
    "assets/images/profile_icons/clock.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: SizeConfig.height(context, 0.02)),
            width: SizeConfig.width(context, 1),
            height: SizeConfig.height(context, 0.35),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: SizeConfig.height(context, 0.1)),
                  width: SizeConfig.width(context, 1),
                  height: SizeConfig.height(context, 0.15),
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: SizeConfig.width(context, 0.06),
                        color: GlobalColor.head2TextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: SizeConfig.width(context, 0.25),
                  height: SizeConfig.height(context, 0.1),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: GlobalColor.imageBgColor,
                        radius: SizeConfig.width(context, 0.12),
                        child: Image.asset("assets/images/user_img.png"),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: GlobalColor.btnColor,
                          radius: SizeConfig.width(context, 0.05),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                HeadingTextWidget(text: "Richard Dan"),
                SubHeadingTextWidget(text: "richarddan11@gmail.com")
              ],
            ),
          ),
          HeadingTextWidget(text: "Account", fontSize: SizeConfig.width(context, 0.05),color: GlobalColor.productDisColor,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
              width: SizeConfig.width(context, 1),
              height: SizeConfig.height(context, 0.65),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _options1.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      leading: Image.asset(_Images1[index],),
                      trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp, color: GlobalColor.head2TextColor,),),
                      title: SubHeadingTextWidget(
                        text: _options1[index],
                        fontSize: SizeConfig.width(context, 0.05),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          /*Expanded(
            child: Container(
              padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
              width: SizeConfig.width(context, 1),
              height: SizeConfig.height(context, 0.65),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _options1.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.height(context, 0.02),
                      horizontal: SizeConfig.width(context, 0.02),
                    ),
                    decoration: BoxDecoration(
                      color: GlobalColor.head2TextColor,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.width(context, 0.08)),
                    ),
                    child: IntrinsicWidth(
                      child: ListTile(
                        title: SubHeadingTextWidget(
                          text: _options1[index],
                          color: Colors.white,
                          fontSize: SizeConfig.width(context, 0.04),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
