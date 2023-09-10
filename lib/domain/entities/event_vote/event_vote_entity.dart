part of entity;

// import 'package:hive/hive.dart';

@HiveType(typeId: 15)
class EventVoteEntity extends HiveObject {

  final int? vote1;
  final int? vote2;

  EventVoteEntity({
    this.vote1,
    this.vote2,
  });
}