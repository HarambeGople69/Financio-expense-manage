import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OurIncomeIcon extends StatelessWidget {
  const OurIncomeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffA1EA22),
      highlightColor: const Color(0xff3EAC30),
      child: Icon(
        Icons.arrow_upward,
        size: ScreenUtil().setSp(30),
      ),
    );
  }
}
