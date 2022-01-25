import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/our_shimmer_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_transaction_tile.dart';

class AllTransactionScreen extends StatefulWidget {
  const AllTransactionScreen({Key? key}) : super(key: key);

  @override
  _AllTransactionScreenState createState() => _AllTransactionScreenState();
}

class _AllTransactionScreenState extends State<AllTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: logoColor,
        title: Text(
          "All transaction",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(22.5),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(20),
          vertical: ScreenUtil().setSp(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const OurShimmerText(
                title: "Recent Transactions",
              ),
              const OurSizedBox(),
              ValueListenableBuilder(
                valueListenable:
                    Hive.box<TransActionModel>(transitionList).listenable(),
                builder:
                    (context, Box<TransActionModel> transActionList, child) {
                  // ignore: non_constant_identifier_names
                  List<int> Keys = transActionList.keys.cast<int>().toList();

                  return Keys.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Keys.length,
                          itemBuilder: (context, index) {
                            final int key = Keys[index];
                            final TransActionModel transActionModel =
                                transActionList.get(key)!;
                            return OurTransactionTile(
                                transActionModel: transActionModel);
                          })
                      : Column(
                          children: [
                            Lottie.asset(
                              'assets/animations/notransaction.json',
                              height: ScreenUtil().setSp(200),
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                            OurSizedBox(),
                            Text(
                              "No Transaction made yet",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(17.5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
