import 'package:assignment3/screens/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
      child: ListTile(
        onTap: () => {},
        leading: Avatar(avatarUrl: avatarUrl!),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryText(text: name!, fontSize: 18),
            PrimaryText(text: time!, color: Colors.grey[400], fontSize: 14),
          ],
        ),
        subtitle: PrimaryText(
            text: message!,
            color: Colors.grey[600],
            fontSize: 14,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
