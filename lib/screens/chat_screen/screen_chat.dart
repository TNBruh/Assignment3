import 'package:assignment3/controllers/chat.controller.dart';
import 'package:assignment3/controllers/user.controller.dart';
import 'package:assignment3/models/message.model.dart';

import '../widget/color_pallete.dart';
import '../widget/text.dart';
import '../constant.dart'; //placeholder messages imported through here
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:developer';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller text field
    final TextEditingController _chatfieldcontroller = TextEditingController();
    // controller listview
    ScrollController _listviewcontroller = new ScrollController();
    // user
    final User _user = Get.put(User());
    // get arguments topic
    final String _topic = Get.arguments;
    // get
    final Chat chatController = Get.put(Chat());
    // get name channel
    final String namechanell = getNameChannel();

    return Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            text: "${namechanell} Group ",
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
                  child: Obx(
                    () => ListView.builder(
                      itemCount: getChannel().length,
                      controller: _listviewcontroller,
                      itemBuilder: (context, index) {
                        //this feels sub-optimal, lmao
                        var channel;
                        switch (Get.arguments) {
                          case 'alpha':
                            channel = chatController.alpha;
                            break;
                          case 'beta':
                            channel = chatController.beta;
                            break;
                          case 'gamma':
                            channel = chatController.gamma;
                            break;
                        }

                        final Message msg = channel[index];
                        final Widget res = (msg.sender == _user.username)
                            ? sender(msg.content)
                            : receiver(msg.content, msg.sender);
                        return res;
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.w),
                  decoration: BoxDecoration(color: ColorPallete.primary),
                  child: TextField(
                    controller: _chatfieldcontroller,
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
                          onPressed: () async {
                            log('pressed', name: 'pressed button');
                            //SEND MESSAGE
                            String Content =
                                _chatfieldcontroller.text.toString(); // content
                            _chatfieldcontroller.clear();
                            FocusScope.of(context).unfocus();
                            log(Content, name: 'message content');
                            //1. PARSE INPUT INTO MESSAGE MODEL
                            final message = Message(
                              sender: _user.username,
                              content: Content,
                              topic: _topic,
                            );

                            log(message.toString(), name: 'formed message');
                            //2. USE CHAT CONTROLLER TO SEND THE MESSAGE MODEL
                            chatController.broadcast(message);
                            log('sent request', name: 'broadcasting');
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

  RxList<dynamic> getChannel() {
    final Chat chatController = Get.put(Chat());
    switch (Get.arguments) {
      case 'alpha':
        return chatController.alpha;
      case 'beta':
        return chatController.beta;
      case 'gamma':
        return chatController.gamma;
      default:
        log('meh', name: 'sussy wussy');
        break;
    }

    return chatController.gamma;
  }

  String getNameChannel() {
    final Chat chatController = Get.put(Chat());
    switch (Get.arguments) {
      case 'alpha':
        return 'Flutter';
      case 'beta':
        return 'Kotlin';
      case 'gamma':
        return 'Swift';
    }
    return 'Flutter';
  }
}
