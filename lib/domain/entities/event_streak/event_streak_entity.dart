part of entity;

@HiveType(typeId: 0)
class EventStreakEntity extends HiveObject {

  @HiveField(0)
  final EventStreakType type;

  @HiveField(1)
  final bool? continued;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? team;

  @HiveField(4)
  final String? value;

  EventStreakEntity({
    required this.type,
    required this.name,
    required this.team,
    this.continued,
    this.value,
  });

}