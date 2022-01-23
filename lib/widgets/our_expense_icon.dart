import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OurExpenseIcon extends StatelessWidget {
  const OurExpenseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xffF74040),
      highlightColor: Color(0xffC30707),
      child: Icon(
        Icons.arrow_upward,
        size: ScreenUtil().setSp(30),
      ),
    );
  }
}
