import '../chat_screen/screen_chat.dart';
import '../widget/color_pallete.dart';
import '../widget/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'component_avatar.dart';

class ItemChat extends StatelessWidget {
  final String? avatarUrl;
  final String? name;
  final String? message;
  final String? time;

  ItemChat(
      {required this.avatarUrl,
      required this.name,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.5.h),
      child: Column(
        children: [
          ListTile(
            onTap: () => {Get.to(ChatScreen())},
            leading: Avatar(avatarUrl: avatarUrl!),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryText(
                  text: name!,
                  fontSize: 14.sp,
                  color: ColorPallete.textBlack,
                ),
                PrimaryText(
                    text: time!, color: Colors.grey[600], fontSize: 10.sp),
              ],
            ),
            subtitle: PrimaryText(
                text: message!,
                color: Colors.grey[600],
                fontSize: 10.sp,
                overflow: TextOverflow.ellipsis),
          ),
          Divider(color: ColorPallete.textGrey)
        ],
      ),
    );
  }
}
