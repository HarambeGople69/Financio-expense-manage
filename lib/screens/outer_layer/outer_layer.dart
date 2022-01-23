import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/screens/dashboard_screen/dashboard_screen.dart';
import 'package:myapp/screens/onboarding_screen/onboarding_screen.dart';
import 'package:myapp/screens/user_name_setup/user_name_setup.dart';

class OuterLayer extends StatefulWidget {
  const OuterLayer({Key? key}) : super(key: key);

  @override
  _OuterLayerState createState() => _OuterLayerState();
}

class _OuterLayerState extends State<OuterLayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<int>("outerLayer").listenable(),
        builder: (context, Box<int> boxs, child) {
          int value = boxs.get("state", defaultValue: 0)!;
          return value == 0
              ? const OnBoardingScreen()
              : value == 1
                  ? UserNameSetup()
                  : const DashBoardScreen();
        },
      ),
    );
  }
}
