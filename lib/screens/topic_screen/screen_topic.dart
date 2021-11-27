import 'package:assignment3/screens/topic_screen/component_itemchat.dart';
import 'package:assignment3/screens/widget/color_pallete.dart';
import 'package:assignment3/screens/widget/text.dart';
import 'package:assignment3/screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            text: "Chats List",
            fontSize: 16.0.sp,
          ),
          leading: BackButton(
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
            height: 100.h,
            decoration: BoxDecoration(color: ColorPallete.background),
            child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ItemChat(
                    avatarUrl: userList[index]['avatar']!,
                    name: userList[index]['name']!,
                    topic: userList[index]['topic'],
                  );
                }),
          )),
        ));
  }
}
