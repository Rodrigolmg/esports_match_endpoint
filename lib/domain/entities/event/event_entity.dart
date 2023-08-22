import 'package:esports_match_endpoint/domain/entities/event/change_entity.dart';
import 'package:esports_match_endpoint/domain/entities/event/team_entity.dart';
import 'package:esports_match_endpoint/domain/entities/event/tournament_entity.dart';
import 'package:hive/hive.dart';

class EventEntity extends HiveObject {

  final Map<String, dynamic>? awayScore;
  final TeamEntity? awayTeam;
  final int? bestOf;
  final ChangeEntity? changes;
  final int? coverage;
  final String? createdByNickname;
  final bool? crowdSourcingDataDisplayEnabled;
  final String? customId;
  final int? defaultPeriodCount;
  final int? defaultPeriodLength;
  final String? eventType;
  final String? eventEditorName;
  final bool? fanRatingEvent;
  final bool? finalResultOnly;
  final bool? hasGlobalHighlights;
  final Map<String, dynamic>? homeScore;
  final TeamEntity? homeTeam;
  final int id;
  final Map<String, dynamic>? periods;
  final Map<String, dynamic>? roundInfo;
  final Map<String, dynamic>? season;
  final bool? showToPromo;
  final String? slug;
  final int? startTimestamp;
  final Map<String, dynamic>? status;
  final Map<String, dynamic>? time;
  final TournamentEntity? tournament;
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