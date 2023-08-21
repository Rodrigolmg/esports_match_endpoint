import 'package:hive/hive.dart';

@HiveType(typeId: 1)
enum EventStreakType {
  general('general'), h2h('head2head');

  @HiveField(0)
  final String type;

  const EventStreakType(this.type);

}