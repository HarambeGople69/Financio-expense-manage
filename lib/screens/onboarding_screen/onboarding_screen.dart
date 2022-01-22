import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/our_shimmer_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:onboarding/onboarding.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Lottie.asset(
            'assets/animations/f2.json',
            height: ScreenUtil().setSp(300),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const OurSizedBox(),
          const OurSizedBox(),
          const OurSizedBox(),
          const OurShimmerText(
            title: 'PREPARE REPORT',
          )
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Lottie.asset(
            'assets/animations/f1.json',
            height: ScreenUtil().setSp(300),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const OurSizedBox(),
          const OurSizedBox(),
          const OurSizedBox(),
          const OurShimmerText(
            title: 'Keep track of Expenses',
          )
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Lottie.asset(
            'assets/animations/f3.json',
            height: ScreenUtil().setSp(300),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          const OurSizedBox(),
          const OurSizedBox(),
          const OurSizedBox(),
          const OurShimmerText(
            title: 'PROTECT YOUR FINANCE FUTURE',
          )
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
          proceedpButtonText: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
          proceedButtonPadding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(15),
            vertical: ScreenUtil().setSp(5),
          ),
          proceedButtonColor: logoColor,
          proceedButtonRoute: (context) async {
            await Hive.box<int>("outerLayer").put("state", 1);
          },
        ),
        // isSkippable = true,
        pages: onboardingPagesList,
        indicator: Indicator(
          closedIndicator: const ClosedIndicator(
            color: lightlogoColor,
          ),
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygonSpacer: ScreenUtil().setSp(25),
              polygonRadius: ScreenUtil().setSp(8.5),
              polygon: DesignType.polygon_circle,
            ),
          ),
        ),
        skipButtonStyle: SkipButtonStyle(
          skipButtonColor: logoColor,
          skipButtonText: Text(
            "Skip",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
            ),
          ),
          skipButtonPadding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(15),
            vertical: ScreenUtil().setSp(5),
          ),
        ),
        //-------------Other properties--------------
        //Color background,
        //EdgeInsets pagesContentPadding
        //EdgeInsets titleAndInfoPadding
        //EdgeInsets footerPadding
        //SkipButtonStyle skipButtonStyle
      ),
    ));
  }
}
