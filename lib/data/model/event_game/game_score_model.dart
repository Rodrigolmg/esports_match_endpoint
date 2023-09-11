part of model;

class GameScoreModel extends GameScoreEntity {

  GameScoreModel({
    int? display,
    int? period1,
    int? period2,
  }) : super(
    display: display,
    period1: period1,
    period2: period2
  );

  factory GameScoreModel.fromJson(Map<String, dynamic> json) {
    GameScoreModel gameScore = GameScoreModel(
      display: json['display'],
      period1: json['period1'],
      period2: json['period2'],
    );

    return gameScore;
  }
}