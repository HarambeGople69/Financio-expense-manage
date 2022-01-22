import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/models/transaction_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(20),
            vertical: ScreenUtil().setSp(10),
          ),
          child: ValueListenableBuilder(
            valueListenable:
                Hive.box<TransActionModel>(transitionList).listenable(),
            builder: (context, Box<TransActionModel> transActionList, child) {
              // ignore: non_constant_identifier_names
              List<int> Keys = transActionList.keys.cast<int>().toList();
              return ListView.builder(
                  itemCount: Keys.length,
                  itemBuilder: (context, index) {
                    final int key = Keys[index];
                    final TransActionModel transActionModel =
                        transActionList.get(key)!;
                    return Text(transActionModel.remarks);
                  });
            },
          ),
        ),
      ),
    );
  }
}
