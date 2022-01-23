import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class OurExpenseText extends StatelessWidget {
  final String title;
  const OurExpenseText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xffF74040),
      highlightColor: Color(0xffC30707),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(20),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
