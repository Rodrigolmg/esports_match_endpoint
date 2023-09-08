part of entity;

// import 'package:hive/hive.dart';

@HiveType(typeId: 11)
class EventColorEntity extends HiveObject{

  @HiveField(0)
  final String? fancyNumber;

  @HiveField(1)
  final String? number;

  @HiveField(2)
  final String? outline;

  @HiveField(3)
  final String? primary;

  EventColorEntity({
    this.fancyNumber,
    this.number,
    this.outline,
    this.primary,
  });
}