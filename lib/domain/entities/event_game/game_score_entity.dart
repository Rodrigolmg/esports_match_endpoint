part of entity;

@HiveType(typeId: 17)
class GameScoreEntity {

  final int? display;
  final int? period1;
  final int? period2;

  GameScoreEntity({
    this.display,
    this.period1,
    this.period2,
  });
}