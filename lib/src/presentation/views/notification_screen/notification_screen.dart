import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/size_config.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<dynamic> notifications = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/notification.json');
    final data = await json.decode(response);

    setState(() {
      notifications = data['notifications']
          .map((data) => InstagramNotification.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: GlobalColor.bgColor,
          title: Container(
            padding:
            EdgeInsets.only(top: SizeConfig.height(context, 0.05)),
            width: SizeConfig.width(context, 1),
            height: SizeConfig.height(context, 0.1),
            child: Text(
              "Notifications",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: SizeConfig.width(context, 0.06),
                  color: GlobalColor.head2TextColor),
              textAlign: TextAlign.center,
            ),
          ),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: ValueKey(notifications[index]),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        // Add your onPressed logic here
                      },
                      backgroundColor: Colors.grey.shade500,
                      foregroundColor: Colors.white,
                      icon: Icons.info_outline,
                      label: 'Info',
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        // Add your onPressed logic here
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_outline_sharp,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: notificationItem(notifications[index]),
              );
              /*Slidable(
                // actionPane: SlidableDrawerActionPane(),
                // actionExtentRatio: 0.25,
                child: notificationItem(notifications[index]),
                secondaryActions: <Widget>[
                  Container(
                      height: 60,
                      color: Colors.grey.shade500,
                      child: Icon(Icons.info_outline, color: Colors.white,)
                  ),
                  Container(
                      height: 60,
                      color: Colors.red,
                      child: Icon(Icons.delete_outline_sharp, color: Colors.white,)
                  ),
                ],
              );*/
            }
        )
    );
  }

  notificationItem(InstagramNotification notification) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                notification.hasStory ?
                Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.orangeAccent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomLeft
                      ),
                      // border: Border.all(color: Colors.red),
                      shape: BoxShape.circle
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(notification.profilePic)
                    ),
                  ),
                ) : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300, width: 1)
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(notification.profilePic)
                  ),
                ),
                SizedBox(width: 10,),
                Flexible(
                  child: RichText(text: TextSpan(
                      children: [
                        TextSpan(text: notification.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        TextSpan(text: notification.content, style: TextStyle(color: Colors.black)),
                        TextSpan(text: notification.timeAgo, style: TextStyle(color: Colors.grey.shade500),)
                      ]
                  )),
                )
              ],
            ),
          ),
          notification.postImage != '' ?
          Container(
            width: 50,
            height: 50,
            child: ClipRRect(
                child: Image.network(notification.postImage)
            ),
          )
              : Container(
              height: 35,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child: Text('Follow', style: TextStyle(color: Colors.white))
              )
          ),
        ],
      ),
    );
  }
}

class InstagramNotification {
  final String name;
  final String profilePic;
  final String content;
  final String postImage;
  final String timeAgo;
  final bool hasStory;

  InstagramNotification(
      this.name,
      this.profilePic,
      this.content,
      this.postImage,
      this.timeAgo,
      this.hasStory
      );

  factory InstagramNotification.fromJson(Map<String, dynamic> json) {
    return new InstagramNotification(
        json['name'],
        json['profilePic'],
        json['content'],
        json['postImage'],
        json['timeAgo'],
        json['hasStory']
    );
  }
}