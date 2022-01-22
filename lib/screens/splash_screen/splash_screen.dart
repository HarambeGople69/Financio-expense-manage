import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/screens/outer_layer/outer_layer.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/our_shimmer_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void completed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OuterLayer(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const OurShimmerText(
              title: "Financio: Expense Manager",
            ),
            const OurSizedBox(),
            const OurSizedBox(),
            const OurSizedBox(),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
                height: ScreenUtil().setSp(300),
                width: ScreenUtil().setSp(300),
              ),
            ),
            const OurSizedBox(),
            const OurSizedBox(),
            const OurSizedBox(),
            SpinKitDualRing(
              color: logoColor,
              size: ScreenUtil().setSp(50),
            )
          ],
        ),
      ),
    );
  }
}
