import 'package:assignment3/controllers/user.controller.dart';
import 'package:assignment3/screens/topic_screen/screen_topic.dart';
import 'package:assignment3/screens/widget/color_pallete.dart';
import 'package:assignment3/screens/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _usernamefieldcontroller =
      TextEditingController();
  final User _user = Get.put(User());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(top: 30.h),
              height: 100.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(color: ColorPallete.background),
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      controller: _usernamefieldcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter username',
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 8.h,
                      width: 100.w,
                      child: TextButton(
                          onPressed: () {
                            // assign username to User()
                            _user.username =
                                _usernamefieldcontroller.text.toString();
                            Get.to(TopicScreen());
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: ColorPallete.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: PrimaryText(
                            text: 'Confirm',
                            color: ColorPallete.textWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )),
                    )
                  ],
                ),
              ))),
    ));
  }
}
