// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransActionModelAdapter extends TypeAdapter<TransActionModel> {
  @override
  final int typeId = 0;

  @override
  TransActionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransActionModel(
      money: fields[0] as int,
      remarks: fields[1] as String,
      type: fields[2] as String,
      dateTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TransActionModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.money)
      ..writeByte(1)
      ..write(obj.remarks)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransActionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
