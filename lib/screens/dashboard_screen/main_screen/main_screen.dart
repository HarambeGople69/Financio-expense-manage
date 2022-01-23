import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/utils.dart';
import 'package:myapp/widgets/our_shimmer_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_transaction_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: logoColor,
        title: Text(
          "Welcome ${Hive.box<String>(userName).get("name")!}",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(30),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(20),
            vertical: ScreenUtil().setSp(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(),
                const OurShimmerText(
                  title: "Recent Transaction",
                ),
                const OurSizedBox(),
                ValueListenableBuilder(
                  valueListenable:
                      Hive.box<TransActionModel>(transitionList).listenable(),
                  builder:
                      (context, Box<TransActionModel> transActionList, child) {
                    // ignore: non_constant_identifier_names
                    List<int> Keys = transActionList.keys.cast<int>().toList();
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Keys.length,
                        itemBuilder: (context, index) {
                          final int key = Keys[index];
                          final TransActionModel transActionModel =
                              transActionList.get(key)!;
                          return OurTransactionTile(
                              transActionModel: transActionModel);
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
