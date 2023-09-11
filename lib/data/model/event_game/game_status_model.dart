part of model;

class GameStatusModel extends GameStatusEntity {

  GameStatusModel({
    int? code,
    String? description,
    String? type
  }) : super(
    code: code,
    description: description,
    type: type
  );

  factory GameStatusModel.fromJson(Map<String, dynamic> json) {
    GameStatusModel gameStatus = GameStatusModel(
      code: json['code'],
      description: json['description'],
      type: json['type']
    );

    return gameStatus;
  }
}