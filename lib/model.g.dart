// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AkatsukiInfoAdapter extends TypeAdapter<AkatsukiInfo> {
  @override
  final int typeId = 0;

  @override
  AkatsukiInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AkatsukiInfo(
      name: fields[0] as String,
      images: (fields[1] as List).cast<String>(),
      jutsu: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AkatsukiInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.jutsu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AkatsukiInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
