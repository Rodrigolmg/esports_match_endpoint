part of model;

class GameMapModel extends GameMapEntity {

  GameMapModel({
    required int id,
    String? name
  }) : super(
    id: id,
    name: name
  );

  factory GameMapModel.fromJson(Map<String, dynamic> json) {
    GameMapModel gameMap = GameMapModel(
      id: json['id'],
      name: json['name']
    );

    return gameMap;
  }
}