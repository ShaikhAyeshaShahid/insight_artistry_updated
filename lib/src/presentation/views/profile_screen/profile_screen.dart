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

  List<Color> _images2Bg =[
    Color(0xff008BD9).withOpacity(0.1),
    Color(0xffFFCC47).withOpacity(0.1),
    Color(0xffF44545).withOpacity(0.1),
  ];
  List<Color> _images1Bg =[
    Color(0xffD9D9D9).withOpacity(0.1),
    Color(0xff1B94A1).withOpacity(0.1),
    Color(0xffFD9F12).withOpacity(0.1),
  ];

  List<String> _Images1 =[
    "assets/images/profile_icons/setting_icon.png",
    "assets/images/profile_icons/bell.png",
    "assets/images/profile_icons/clock.png",
  ];
  List<String> _Images2 =[
    "assets/images/profile_icons/lock.png",
    "assets/images/profile_icons/privacy.png",
    "assets/images/profile_icons/logout.png",
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
            height: SizeConfig.height(context, 0.3),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: SizeConfig.height(context, 0.05)),
                  width: SizeConfig.width(context, 1),
                  height: SizeConfig.height(context, 0.1),
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: SizeConfig.width(context, 0.06),
                        color: GlobalColor.head2TextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
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
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.width(context,0.05), top: SizeConfig.height(context, 0.04),),
            child: HeadingTextWidget(text: "Account", fontSize: SizeConfig.width(context, 0.04),color: GlobalColor.productDisColor,),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _options1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(width:SizeConfig.width(context, 0.1),
                      decoration: BoxDecoration(
                        color: _images1Bg[index],
                        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.02))
                      ),
                      child: Image.asset(_Images1[index],scale: SizeConfig.width(context, 0.004),)),
                  trailing: SizedBox(width: SizeConfig.width(context, 0.1),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp, color: GlobalColor.head2TextColor,),)),
                  title: Container(
                    width: SizeConfig.width(context, 0.1),
                    alignment: AlignmentDirectional.centerStart,
                    child: SubHeadingTextWidget(
                      text: _options1[index],
                      fontSize: SizeConfig.width(context, 0.04),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.width(context,0.05), top: SizeConfig.height(context, 0.04),),
            child: HeadingTextWidget(text: "Account", fontSize: SizeConfig.width(context, 0.04),color: GlobalColor.productDisColor,),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _options2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(width:SizeConfig.width(context, 0.1),
                      decoration: BoxDecoration(
                          color: _images2Bg[index],
                          borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.02))
                      ),
                      child: Image.asset(_Images2[index],scale: SizeConfig.width(context, 0.004),)),
                  trailing: SizedBox(width: SizeConfig.width(context, 0.1),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp, color: GlobalColor.head2TextColor,),)),
                  title: Container(
                    width: SizeConfig.width(context, 0.1),
                    alignment: AlignmentDirectional.centerStart,
                    child: SubHeadingTextWidget(
                      text: _options2[index],
                      fontSize: SizeConfig.width(context, 0.04),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
