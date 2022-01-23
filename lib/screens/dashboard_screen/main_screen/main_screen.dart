import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/models/account_model.dart';
import 'package:myapp/models/transaction_account_detail.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/utils.dart';
import 'package:myapp/widgets/our_balance_detail.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_shimmer_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_transaction_tile.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final List<TransactionAccountDetailModel> chartData = [
  //   SalesData(DateTime.fromMicrosecondsSinceEpoch(120), 35),
  //   SalesData(DateTime.fromMicrosecondsSinceEpoch(140), 28),
  //   SalesData(DateTime.fromMicrosecondsSinceEpoch(160), 34),
  //   SalesData(DateTime.fromMicrosecondsSinceEpoch(170), 32),
  //   SalesData(DateTime.fromMicrosecondsSinceEpoch(180), 40)
  // ];
  late TooltipBehavior _tooltipBehavior;
  List<TransactionAccountDetailModel> transactionDetailList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OurBalanceTile(),
              const OurSizedBox(),
              const OurShimmerText(
                title: "Transaction Report",
              ),
              const OurSizedBox(),

              ValueListenableBuilder(
                valueListenable: Hive.box<TransactionAccountDetailModel>(
                        myTransactionAccountDetail)
                    .listenable(),
                builder: (context,
                    Box<TransactionAccountDetailModel> transActionList, child) {
                  transActionList.values.forEach((element) {
                    transactionDetailList.add(element);
                  });
                  return Expanded(
                    child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehavior,
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                        ),
                        primaryXAxis: DateTimeAxis(
                          // maximum: DateTime(2022),
                          // Interval type will be months
                          intervalType: DateTimeIntervalType.days,
                          // interval: 2,
                        ),
                        series: <ChartSeries>[
                          // Renders line chart

                          LineSeries<TransactionAccountDetailModel, DateTime>(
                              markerSettings: MarkerSettings(isVisible: true),
                              name: "Balance",
                              dataSource: transactionDetailList,
                              xValueMapper:
                                  (TransactionAccountDetailModel detail, _) =>
                                      detail.time,
                              yValueMapper:
                                  (TransactionAccountDetailModel detail, _) =>
                                      detail.balance),

                          LineSeries<TransactionAccountDetailModel, DateTime>(
                              markerSettings: MarkerSettings(isVisible: true),
                              name: "Income",
                              dataSource: transactionDetailList,
                              xValueMapper:
                                  (TransactionAccountDetailModel detail, _) =>
                                      detail.time,
                              yValueMapper:
                                  (TransactionAccountDetailModel detail, _) =>
                                      detail.income),
                          LineSeries<TransactionAccountDetailModel, DateTime>(
                              markerSettings: MarkerSettings(isVisible: true),
                              name: "Expense",
                              dataSource: transactionDetailList,
                              xValueMapper:
                                  (TransactionAccountDetailModel detail, _) =>
                                      detail.time,
                              yValueMapper:
                                  (TransactionAccountDetailModel detail, _) =>
                                      detail.expense)
                        ]),
                  );
                  // return OurElevatedButton(
                  //   title: "title",
                  //   function: () {
                  //     print("object");
                  //     print(transactionDetailList);
                  //   },
                  // );
                  // ignore: non_constant_identifier_names
                  // List<int> Keys = transActionList.keys.cast<int>().toList();
                  // return ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: Keys.length,
                  //     itemBuilder: (context, index) {
                  //       final int key = Keys[index];
                  //       final TransActionModel transActionModel =
                  //           transActionList.get(key)!;
                  //       return OurTransactionTile(transActionModel: transActionModel);
                  //     });
                },
              ),
              // SfCartesianChart(
              //     primaryXAxis: DateTimeAxis(
              //         // Interval type will be months
              //         intervalType: DateTimeIntervalType.auto,
              //         interval: 2),
              //     series: <ChartSeries>[
              //       // Renders line chart
              //       LineSeries<TransactionAccountDetailModel, DateTime>(
              //           dataSource: chartData,
              //           xValueMapper: (TransactionAccountDetailModel sales, _) => sales.year,
              //           yValueMapper: (TransactionAccountDetailModel sales, _) => sales.sales)
              //     ])
            ],
          ),
        ),
      ),
    );
  }
}

// class SalesDataa {
//   SalesData(this.year, this.sales);
//   final DateTime year;
//   final double sales;
// }
