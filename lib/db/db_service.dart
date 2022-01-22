import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/controller/dashboard_controller.dart';
import 'package:myapp/models/transaction_model.dart';

const String transitionList = "TransActionModelList";

class dbHelper {
  addTransaction(TransActionModel transActionModel) {
    print("=======");
    var box = Hive.box<TransActionModel>(transitionList);
    try {
      box.add(transActionModel);
      print("Done");
      Get.find<DashboardController>().changeIndexs(0);
    } catch (e) {
      print(e);
    }
  }
}
