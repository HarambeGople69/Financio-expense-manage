import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/models/account_model.dart';

import 'our_sized_box.dart';

class OurBalanceTile extends StatelessWidget {
  const OurBalanceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        valueListenable: Hive.box<AccountModel>(myBalance).listenable(),
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
              OurSizedBox(),
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
                      OurSizedBox(),
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
                      OurSizedBox(),
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
    );
  }
}
