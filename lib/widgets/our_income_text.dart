import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class OurIncomeText extends StatelessWidget {
  final String title;
  const OurIncomeText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xffA1EA22),
      highlightColor: Color(0xff3EAC30),
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
