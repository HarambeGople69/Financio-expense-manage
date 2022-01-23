import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/controller/dashboard_controller.dart';
import 'package:myapp/models/account_model.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';

const String transitionList = "TransActionModelList";
const String userName = "userName";
const String myBalance = "myBalance";

class dbHelper {
  addTransaction(TransActionModel transActionModel) {
    AccountModel myAccount = Hive.box<AccountModel>(myBalance).get(0)!;
    if (transActionModel.type == "Expense") {
      if (transActionModel.money > myAccount.balance) {
        OurToast().showErrorToast("Oops, Not enough balance");
      } else {
        //============Expense=================

        var box = Hive.box<TransActionModel>(transitionList);
        try {
          box.add(transActionModel);
          print("Done");

          double balance = myAccount.balance;
          double income = myAccount.income;
          double expense = myAccount.expense;

          expense = expense + transActionModel.money;
          balance = balance - transActionModel.money;

          Hive.box<AccountModel>(myBalance).put(
            0,
            AccountModel(
              balance: balance,
              income: income,
              expense: expense,
            ),
          );
          Get.find<DashboardController>().changeIndexs(0);
        } catch (e) {
          print(e);
        }
      }
    } else {
      //==========Income==================

      var box = Hive.box<TransActionModel>(transitionList);
      try {
        box.add(transActionModel);

        // balance updated here

        double balance = myAccount.balance;
        double income = myAccount.income;
        double expense = myAccount.expense;

        income = income + transActionModel.money;
        balance = balance + transActionModel.money;

        Hive.box<AccountModel>(myBalance).put(
          0,
          AccountModel(
            balance: balance,
            income: income,
            expense: expense,
          ),
        );
        Get.find<DashboardController>().changeIndexs(0);
      } catch (e) {
        print(e);
      }
    }
  }

  setUserName(String name) async {
    var box = Hive.box<String>(userName);
    try {
      box.put("name", name);
      await Hive.box<int>("outerLayer").put("state", 2);
      await Hive.box<AccountModel>(myBalance).put(
        0,
        AccountModel(
          balance: 0.0,
          income: 0.0,
          expense: 0.0,
        ),
      );
    } catch (e) {
      OurToast().showErrorToast(
        e.toString(),
      );
    }
  }

  updateBalance(AccountModel accountModel) {
    var box = Hive.box<AccountModel>(myBalance);
    box.put(0, accountModel);
  }
}
