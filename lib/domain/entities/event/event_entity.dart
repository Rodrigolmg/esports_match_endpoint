part of entity;

@HiveType(typeId: 2)
class EventEntity extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final TeamEntity? awayTeam;

  @HiveField(2)
  final int? bestOf;

  @HiveField(3)
  final ChangeEntity? changes;

  @HiveField(4)
  final int? coverage;

  @HiveField(5)
  final String? createdByNickname;

  @HiveField(6)
  final bool? crowdSourcingDataDisplayEnabled;

  @HiveField(7)
  final String? customId;

  @HiveField(8)
  final int? defaultPeriodCount;

  @HiveField(9)
  final int? defaultPeriodLength;

  @HiveField(10)
  final String? eventType;

  @HiveField(11)
  final String? eventEditorName;

  @HiveField(12)
  final bool? fanRatingEvent;

  @HiveField(13)
  final bool? finalResultOnly;

  @HiveField(14)
  final bool? hasGlobalHighlights;

  @HiveField(15)
  final Map<String, dynamic>? homeScore;

  @HiveField(16)
  final TeamEntity? homeTeam;

  @HiveField(17)
  final Map<String, dynamic>? awayScore;

  @HiveField(18)
  final Map<String, dynamic>? periods;

  @HiveField(19)
  final Map<String, dynamic>? roundInfo;

  @HiveField(20)
  final Map<String, dynamic>? season;

  @HiveField(21)
  final bool? showToPromo;

  @HiveField(22)
  final String? slug;

  @HiveField(23)
  final int? startTimestamp;

  @HiveField(24)
  final Map<String, dynamic>? status;

  @HiveField(25)
  final Map<String, dynamic>? time;

  @HiveField(26)
  final TournamentEntity? tournament;

  @HiveField(27)
  final int? winnerCode;

  EventEntity({
    this.awayScore,
    this.awayTeam,
    this.bestOf,
    this.changes,
    this.coverage,
    this.createdByNickname,
    this.crowdSourcingDataDisplayEnabled,
    this.customId,
    this.defaultPeriodCount,
    this.defaultPeriodLength,
    this.eventType,
    this.eventEditorName,
    this.fanRatingEvent,
    this.finalResultOnly,
    this.hasGlobalHighlights,
    this.homeScore,
    this.homeTeam,
    required this.id,
    this.periods,
    this.roundInfo,
    this.season,
    this.showToPromo,
    this.slug,
    this.startTimestamp,
    this.status,
    this.time,
    this.tournament,
    this.winnerCode,
  });
}