// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_account_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAccountDetailAdapter
    extends TypeAdapter<TransactionAccountDetailModel> {
  @override
  final int typeId = 2;

  @override
  TransactionAccountDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionAccountDetailModel(
      balance: fields[0] as double,
      income: fields[1] as double,
      expense: fields[2] as double,
      time: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionAccountDetailModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.balance)
      ..writeByte(1)
      ..write(obj.income)
      ..writeByte(2)
      ..write(obj.expense)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAccountDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
