part of entity;

@HiveType(typeId: 17)
class GameScoreEntity extends HiveObject {

  @HiveField(0)
  final int? display;

  @HiveField(1)
  final int? period1;

  @HiveField(2)
  final int? period2;

  GameScoreEntity({
    this.display,
    this.period1,
    this.period2,
  });
}