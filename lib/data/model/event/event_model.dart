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
    String? createdByNickname,
    bool? crowdSourcingDataDisplayEnabled,
    String? customId,
    int? defaultPeriodCount,
    int? defaultPeriodLength,
    String? eventType,
    String? eventEditorName,
    bool? fanRatingEvent,
    bool? finalResultOnly,
    bool? hasGlobalHighlights,
    Map<String, dynamic>? homeScore,
    TeamModel? homeTeam,
    Map<String, dynamic>? periods,
    Map<String, dynamic>? roundInfo,
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
    createdByNickname: createdByNickname,
    crowdSourcingDataDisplayEnabled: crowdSourcingDataDisplayEnabled,
    customId: customId,
    defaultPeriodCount: defaultPeriodCount,
    defaultPeriodLength: defaultPeriodLength,
    eventType: eventType,
    eventEditorName: eventEditorName,
    fanRatingEvent: fanRatingEvent,
    finalResultOnly: finalResultOnly,
    hasGlobalHighlights: hasGlobalHighlights,
    homeScore: homeScore,
    homeTeam: homeTeam,
    periods: periods,
    roundInfo: roundInfo,
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

    EventModel? event = EventModel(
      id: json['id'],
      awayScore: json.containsKey('awayScore') ? json['awayScore'] : null,
      awayTeam: json.containsKey('awayTeam') ?
        TeamModel.fromJson(json['awayTeam']) : null,
      bestOf: json.containsKey('bestOf') ? json['bestOf'] : null,
      changes: json.containsKey('changes') ?
        ChangeModel.fromJson(json['changes']) : null,
      coverage: json.containsKey('coverage') ? json['coverage'] : null,
      createdByNickname: json.containsKey('createdByNickname') ? json['createdByNickname'] : null,
      crowdSourcingDataDisplayEnabled: json.containsKey('crowdSourcingDataDisplayEnabled') ?
        json['crowdSourcingDataDisplayEnabled'] : null,
      customId: json.containsKey('customId') ? json['customId'] : null,
      defaultPeriodCount: json.containsKey('defaultPeriodCount') ? json['defaultPeriodCount'] : null,
      defaultPeriodLength: json.containsKey('defaultPeriodLength') ? json['defaultPeriodLength'] : null,
      eventType: json.containsKey('eventType') ? json['eventType'] : null,
      eventEditorName: json.containsKey('eventEditorName') ? json['eventEditorName'] : null,
      fanRatingEvent: json.containsKey('fanRatingEvent') ? json['fanRatingEvent'] : null,
      finalResultOnly: json.containsKey('finalResultOnly') ? json['finalResultOnly'] : null,
      hasGlobalHighlights: json.containsKey('hasGlobalHighlights') ?
        json['hasGlobalHighlights'] : null,
      homeScore: json.containsKey('homeScore') ? json['homeScore'] : null,
      homeTeam: json.containsKey('homeTeam') ? TeamModel.fromJson(json['homeTeam']) : null,
      periods: json.containsKey('periods') ? json['periods'] : null,
      roundInfo: json.containsKey('roundInfo') ? json['roundInfo'] : null,
      season: json.containsKey('season') ? json['season'] : null,
      showToPromo: json.containsKey('showToPromo') ? json['showToPromo'] : null,
      slug: json.containsKey('slug') ? json['slug'] : null,
      startTimestamp: json.containsKey('startTimestamp') ? json['startTimestamp'] : null,
      status: json.containsKey('status') ? json['status'] : null,
      time: json.containsKey('time') ? json['time'] : null,
      tournament: json.containsKey('tournament') ?
        TournamentModel.fromJson(json['tournament']) : null,
      winnerCode: json.containsKey('winnerCode') ?json['winnerCode'] : null
    );

    return event;
  }

}