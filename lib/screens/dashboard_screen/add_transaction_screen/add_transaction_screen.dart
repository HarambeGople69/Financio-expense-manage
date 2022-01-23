// ignore_for_file: non_constant_identifier_names, prefer_final_fields, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/utils.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_text_field.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  // ignore: non_constant_identifier_names, prefer_final_fields
  TextEditingController _money_controller = TextEditingController();
  // ignore: non_constant_identifier_names, prefer_final_fields
  TextEditingController _remarks_controller = TextEditingController();
  // ignore: non_constant_identifier_names, prefer_final_fields
  TextEditingController _date_controller = TextEditingController();
  // TextEditingController _money_controller = TextEditingController();
  // ignore: non_constant_identifier_names, unused_field
  final FocusNode _money_node = FocusNode();
  // ignore: unused_field
  FocusNode _remarks_node = FocusNode();
  // ignore: unused_field
  FocusNode _date_node = FocusNode();
  late DateTime fromdate;

  @override
  void initState() {
    super.initState();

    setState(() {
      fromdate = DateTime.now().add(
        const Duration(minutes: 1),
      );
    });
  }

  List<String> options = [
    "Income",
    "Expense",
  ];
  int tag = 0;
  String choice = "Income";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: logoColor,
            title: Text(
              "Add transaction",
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: _money_controller,
                    validator: (value) {},
                    title: "Enter money",
                    type: TextInputType.number,
                    number: 1,
                  ),
                  const OurSizedBox(),
                  CustomTextField(
                    controller: _remarks_controller,
                    validator: (value) {},
                    title: "Enter remarks",
                    type: TextInputType.name,
                    number: 1,
                  ),
                  const OurSizedBox(),
                  Wrap(
                    children: List<Widget>.generate(
                      2,
                      (int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setSp(5),
                            vertical: ScreenUtil().setSp(5),
                          ),
                          height: ScreenUtil().setSp(40),
                          child: ChoiceChip(
                            label: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Center(
                                child: Text(
                                  options[index],
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(17),
                                  ),
                                ),
                              ),
                            ),
                            selected: tag == index,
                            onSelected: (bool selected) {
                              setState(() {
                                tag = selected ? index : 0;
                                choice = options[tag];
                              });
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  const OurSizedBox(),
                  CustomTextField(
                    controller: _date_controller,
                    validator: (value) {},
                    title: "Pick Date",
                    type: TextInputType.datetime,
                    number: 1,
                    readonly: true,
                    ontap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2222),
                      );
                      if (date == null) {
                        return null;
                      }
                      setState(() {
                        fromdate = DateTime(
                          date.year,
                          date.month,
                          date.day,
                        );
                        _date_controller.text = Utils().customDate(fromdate);
                      });
                    },
                  ),
                  const OurSizedBox(),
                  OurElevatedButton(
                    title: "Add",
                    function: () {
                      if (_money_controller.text.trim().isNotEmpty &&
                          _remarks_controller.text.trim().isNotEmpty &&
                          _date_controller.text.trim().isNotEmpty) {
                        TransActionModel transActionModel = TransActionModel(
                          dateTime: fromdate,
                          money: int.parse(_money_controller.text.trim()),
                          remarks: _remarks_controller.text.trim(),
                          type: choice,
                        );
                        dbHelper().addTransaction(transActionModel);
                        print("Valid");
                      } else {
                        OurToast().showErrorToast("Fields can't be empty");
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
