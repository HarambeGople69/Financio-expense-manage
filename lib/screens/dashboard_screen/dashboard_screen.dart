import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/dashboard_controller.dart';
import 'package:myapp/screens/dashboard_screen/add_transaction_screen/add_transaction_screen.dart';
import 'package:myapp/screens/dashboard_screen/all_transaction_screen/all_transaction_screen.dart';
import 'package:myapp/screens/dashboard_screen/main_screen/main_screen.dart';
import 'package:myapp/utils/colors.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List screens = const [
    MainScreen(),
    AddTransactionScreen(),
    AllTransactionScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: screens[Get.find<DashboardController>().indexs.value],
          bottomNavigationBar: CurvedNavigationBar(
            index: Get.find<DashboardController>().indexs.value,
            buttonBackgroundColor: logoColor,
            height: ScreenUtil().setSp(50),
            color: logoColor,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            items: [
              Icon(
                Icons.assessment,
                size: ScreenUtil().setSp(25),
                color: Colors.white,
              ),
              Icon(
                Icons.assignment,
                size: ScreenUtil().setSp(25),
                color: Colors.white,
              ),
              Icon(
                Icons.account_tree_outlined,
                size: ScreenUtil().setSp(25),
                color: Colors.white,
              ),
            ],
            onTap: (index) {
              Get.find<DashboardController>().changeIndexs(index);
              //Handle button tap
            },
          ),
        );
      },
    );
  }
}
