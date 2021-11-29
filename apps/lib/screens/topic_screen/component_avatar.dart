import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final double? width;
  final double? height;

  Avatar({
    required this.avatarUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 14.w,
      height: height ?? 14.w,
      margin: EdgeInsets.only(right: 2.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
              image: AssetImage(avatarUrl),
              fit: BoxFit.fitWidth,
              alignment: Alignment.center)),
    );
  }
}
