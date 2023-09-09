part of model;

class TeamDuelModel extends TeamDuelEntity {

  TeamDuelModel({
    int? awayWins,
    int? draws,
    int? homeWins
  }) : super(
    awayWins: awayWins,
    draws: draws,
    homeWins: homeWins
  );

  factory TeamDuelModel.fromJson(Map<String, dynamic> json) {
    TeamDuelModel duel = TeamDuelModel(
      awayWins: json['awayWins'],
      draws: json['draws'],
      homeWins: json['homeWins']
    );

    return duel;
  }

}