import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';


part 'transaction_model.g.dart';
@HiveType(typeId: 0)
class TransActionModel extends HiveObject {
  @HiveField(0)
  final int money;
  @HiveField(1)
  final String remarks;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final DateTime dateTime;

  TransActionModel({
    required this.money,
    required this.remarks,
    required this.type,
    required this.dateTime,
  });
}
