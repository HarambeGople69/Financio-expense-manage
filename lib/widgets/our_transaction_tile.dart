import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/utils.dart';
import 'package:myapp/widgets/our_expense_icon.dart';
import 'package:myapp/widgets/our_expense_text.dart';
import 'package:myapp/widgets/our_income_icon.dart';
import 'package:myapp/widgets/our_income_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';

class OurTransactionTile extends StatelessWidget {
  final TransActionModel transActionModel;
  const OurTransactionTile({Key? key, required this.transActionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            transActionModel.type == "Expense"
                ? const OurExpenseIcon()
                : const OurIncomeIcon(),
            SizedBox(
              width: ScreenUtil().setSp(10),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transActionModel.remarks,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const OurSizedBox(),
                  Text(
                    Utils().customDate(transActionModel.dateTime),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(12.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            transActionModel.type == "Expense"
                ? OurExpenseText(
                    title: transActionModel.money.toString(),
                  )
                : OurIncomeText(
                    title: transActionModel.money.toString(),
                  ),
          ],
        ),
        const OurSizedBox(),
        const Divider(
          color: lightlogoColor,
        ),
      ],
    );
  }
}
