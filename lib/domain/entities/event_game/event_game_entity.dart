part of entity;

@HiveType(typeId: 16)
class EventGameEntity extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final bool? hasCompleteStatistics;

  @HiveField(2)
  final GameScoreEntity? homeScore;

  @HiveField(3)
  final GameScoreEntity? awayScore;

  @HiveField(4)
  final int? homeTeamStartingSide;

  @HiveField(5)
  final int? length;

  @HiveField(6)
  final GameMapEntity? map;

  @HiveField(7)
  final int? startTimestamp;

  @HiveField(8)
  final GameStatusEntity? status;

  @HiveField(9)
  final int? winnerCode;

  EventGameEntity({
    required this.id,
    this.hasCompleteStatistics,
    this.homeScore,
    this.awayScore,
    this.homeTeamStartingSide,
    this.length,
    this.map,
    this.startTimestamp,
    this.status,
    this.winnerCode,
  });
}