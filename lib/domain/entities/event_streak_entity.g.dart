// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_streak_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventStreakEntityAdapter extends TypeAdapter<EventStreakEntity> {
  @override
  final int typeId = 0;

  @override
  EventStreakEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventStreakEntity(
      type: fields[0] as EventStreakType,
      name: fields[2] as String?,
      team: fields[3] as String?,
      continued: fields[1] as bool?,
      value: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EventStreakEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.continued)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.team)
      ..writeByte(4)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventStreakEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
