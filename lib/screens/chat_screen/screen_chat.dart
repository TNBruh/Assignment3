import 'package:assignment3/controllers/user.controller.dart';

import '../widget/color_pallete.dart';
import '../widget/text.dart';
import '../constant.dart'; //placeholder messages imported through here
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // user
    final User _user = Get.put(User());
    // get arguments topic
    final String _topic = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            text: "Flutter Group " + _topic,
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
            child: Column(
              children: [
                Container(
                  height: 76.h,
                  decoration: BoxDecoration(color: ColorPallete.background),
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 4.h),
                  child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) =>
                          messages[index]['user'] == _user.username
                              ? sender(messages[index]['content']!)
                              : receiver(messages[index]['content']!,
                                  messages[index]['user']!)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.w),
                  decoration: BoxDecoration(color: ColorPallete.primary),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RawMaterialButton(
                          constraints: BoxConstraints(minWidth: 0),
                          onPressed: () {
                            //TODO: SEND BROADCAST MESSAGE
                            /**
                             * Message({
                                required this.sender,
                                required this.content,
                                required this.topic,
                              });
                             */
                          },
                          elevation: 2.0,
                          fillColor: ColorPallete.primary,
                          child:
                              Icon(Icons.send, size: 22.0, color: Colors.white),
                          padding: EdgeInsets.all(10.0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget sender(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: ColorPallete.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(0))),
            child: PrimaryText(
              text: message,
              fontSize: 10.0.sp,
              color: ColorPallete.textWhite,
            ),
          ),
        ],
      ),
    );
  }

  Widget receiver(String message, String from) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            text: from,
            fontSize: 10.0.sp,
            color: ColorPallete.textBlack,
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: PrimaryText(
                      text: message,
                      fontSize: 10.0.sp,
                      color: ColorPallete.textBlack,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
