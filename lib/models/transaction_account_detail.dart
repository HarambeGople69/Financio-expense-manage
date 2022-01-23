import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_account_detail.g.dart';
@HiveType(typeId: 2)
class TransactionAccountDetailModel extends HiveObject {
  @HiveField(0)
  final double balance;
  @HiveField(1)
  final double income;
  @HiveField(2)
  final double expense;
  @HiveField(3)
  final DateTime time;
  TransactionAccountDetailModel({
    required this.balance,
    required this.income,
    required this.expense,
    required this.time,
  });
}
