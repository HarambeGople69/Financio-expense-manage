import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/controller/dashboard_controller.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';

const String transitionList = "TransActionModelList";
const String userName = "userName";
const String myBalance = "myBalance";

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

  setUserName(String name) async {
    var box = Hive.box<String>(userName);
    try {
      box.put("name", name);
      await Hive.box<int>("outerLayer").put("state", 2);
    } catch (e) {
      OurToast().showErrorToast(
        e.toString(),
      );
    }
  }
}
