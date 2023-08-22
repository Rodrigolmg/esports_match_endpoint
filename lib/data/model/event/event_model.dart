
import 'package:esports_match_endpoint/data/model/event/change_model.dart';
import 'package:esports_match_endpoint/data/model/event/team_model.dart';
import 'package:esports_match_endpoint/data/model/event/tournament_model.dart';
import 'package:esports_match_endpoint/domain/entities/event/event_entity.dart';

class EventModel extends EventEntity {

  EventModel({
    required int id,
    Map<String, dynamic>? awayScore,
    TeamModel? awayTeam,
    int? bestOf,
    ChangeModel? changes,
    int? coverage,
    bool? crowdSourcingDataDisplayEnabled,
    String? customId,
    String? eventType,
    bool? fanRatingEvent,
    bool? finalResultOnly,
    bool? hasGlobalHighlights,
    Map<String, dynamic>? homeScore,
    TeamModel? homeTeam,
    Map<String, dynamic>? season,
    bool? showToPromo,
    String? slug,
    int? startTimestamp,
    Map<String, dynamic>? status,
    Map<String, dynamic>? time,
    TournamentModel? tournament,
    int? winnerCode
  }) : super(
    id: id,
    awayScore: awayScore,
    awayTeam: awayTeam,
    bestOf: bestOf,
    changes: changes,
    coverage: coverage,
    crowdSourcingDataDisplayEnabled: crowdSourcingDataDisplayEnabled,
    customId: customId,
    eventType: eventType,
    fanRatingEvent: fanRatingEvent,
    finalResultOnly: finalResultOnly,
    hasGlobalHighlights: hasGlobalHighlights,
    homeScore: homeScore,
    homeTeam: homeTeam,
    season: season,
    showToPromo: showToPromo,
    slug: slug,
    startTimestamp: startTimestamp,
    status: status,
    time: time,
    tournament: tournament,
    winnerCode: winnerCode
  );

  factory EventModel.fromJson(Map<String, dynamic> json){
    EventModel event = EventModel(
      id: json['id'],
      awayScore: json['awayScore'],
      awayTeam: TeamModel.fromJson(json['awayTeam']),
      bestOf: json['bestOf'],
      changes: ChangeModel.fromJson(json['changes']),
      coverage: json['coverage'],
      crowdSourcingDataDisplayEnabled: json['crowdSourcingDataDisplayEnabled'],
      customId: json['customId'],
      eventType: json['eventType'],
      fanRatingEvent: json['fanRatingEvent'],
      finalResultOnly: json['finalResultOnly'],
      hasGlobalHighlights: json['hasGlobalHighlights'],
      homeScore: json['homeScore'],
      homeTeam: TeamModel.fromJson(json['homeTeam']),
      season: json['season'],
      showToPromo: json['showToPromo'],
      slug: json['slug'],
      startTimestamp: json['startTimestamp'],
      status: json['status'],
      time: json['time'],
      tournament: TournamentModel.fromJson(json['tournament']),
      winnerCode: json['winnerCode']
    );

    return event;
  }
}