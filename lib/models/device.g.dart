// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceAdapter extends TypeAdapter<Device> {
  @override
  final int typeId = 0;

  @override
  Device read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Device(
      deviceName: fields[0] as String,
      deviceType: fields[1] as String,
      stt: fields[2] as bool,
      bts: fields[3] as double,
      mod: fields[4] as String,
      clr: fields[5] as String,
      spd: fields[6] as double,
      vol: fields[7] as double,
      rnb: fields[8] as int,
      xkd: fields[9] as double,
      ykd: fields[10] as double,
      zkd: fields[11] as double,
      tmp: fields[12] as double,
      lix: fields[13] as double,
      id: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Device obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.deviceName)
      ..writeByte(1)
      ..write(obj.deviceType)
      ..writeByte(2)
      ..write(obj.stt)
      ..writeByte(3)
      ..write(obj.bts)
      ..writeByte(4)
      ..write(obj.mod)
      ..writeByte(5)
      ..write(obj.clr)
      ..writeByte(6)
      ..write(obj.spd)
      ..writeByte(7)
      ..write(obj.vol)
      ..writeByte(8)
      ..write(obj.rnb)
      ..writeByte(9)
      ..write(obj.xkd)
      ..writeByte(10)
      ..write(obj.ykd)
      ..writeByte(11)
      ..write(obj.zkd)
      ..writeByte(12)
      ..write(obj.tmp)
      ..writeByte(13)
      ..write(obj.lix)
      ..writeByte(14)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
