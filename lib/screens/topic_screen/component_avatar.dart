import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Avatar extends StatelessWidget {
  final String avatarUrl;
  final double? width;
  final double? height;

  const Avatar({
    required this.avatarUrl,
    this.width: 60,
    this.height: 60,
  });
  // TODO: show avatar group
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(right: 2.w),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
              image: AssetImage(avatarUrl),
              fit: BoxFit.fitWidth,
              alignment: Alignment.center)),
    );
  }
}
