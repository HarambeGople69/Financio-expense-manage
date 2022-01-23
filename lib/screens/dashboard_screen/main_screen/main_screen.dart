import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/models/account_model.dart';
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
                Container(
                  height: ScreenUtil().setSp(150),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff26F4E8),
                        Color(0xff269CF4),
                        Color(0xffC244F7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setSp(40),
                    ),
                  ),
                  child: ValueListenableBuilder(
                    valueListenable:
                        Hive.box<AccountModel>(myBalance).listenable(),
                    builder: (context, Box<AccountModel> boxs, child) {
                      AccountModel accountModel = boxs.get(0)!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Balance",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(25),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${accountModel.balance}",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          OurSizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "My Income",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${accountModel.income}",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "My Expenses",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${accountModel.expense}",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
                const OurSizedBox(),
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
