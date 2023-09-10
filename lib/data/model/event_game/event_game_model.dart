part of model;

class EventGameModel extends EventGameEntity {


  EventGameModel({
    required int id,
    bool? hasCompleteStatistics,
    GameScoreEntity? homeScore,
    GameScoreEntity? awayScore,
    int? homeTeamStartingSide,
    int? length,
    GameMapEntity? map,
    int? startTimestamp,
    GameStatusEntity? status,
    int? winnerCode,
  }) : super(
    id: id,
    hasCompleteStatistics: hasCompleteStatistics,
    homeScore: homeScore,
    awayScore: awayScore,
    homeTeamStartingSide: homeTeamStartingSide,
    length: length,
    map: map,
    startTimestamp: startTimestamp,
    status: status,
    winnerCode: winnerCode
  );

  factory EventGameModel.fromJson(Map<String, dynamic> json) {
    EventGameModel eventGameModel = EventGameModel(
      id: json['id'],
      hasCompleteStatistics: json['hasCompleteStatistics'],
      homeScore: GameScoreModel.fromJson(json['homeScore']),
      awayScore: GameScoreModel.fromJson(json['awayScore']),
      homeTeamStartingSide: json['homeTeamStartingSide'],
      length: json['length'],
      map: GameMapModel.fromJson(json['map']),
      startTimestamp: json['startTimestamp'],
      status: GameStatusModel.fromJson(json['status']),
      winnerCode: json['winnerCode']
    );

    return eventGameModel;
  }
}