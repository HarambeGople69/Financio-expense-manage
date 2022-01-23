import 'package:hive_flutter/hive_flutter.dart';
part 'account_model.g.dart';
@HiveType(typeId: 1)
class AccountModel extends HiveObject {
  @HiveField(0)
  final double balance;
  @HiveField(1)
  final double income;
  @HiveField(2)
  final double expense;

  AccountModel({
    required this.balance,
    required this.income,
    required this.expense,
  });
}
