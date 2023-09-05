part of model;

class LineUpModel extends LineUpEntity {

  LineUpModel({
    LineUpType? type,
    EventColorModel? goalKeeperColor,
    EventColorModel? playerColor,
    List<PlayerModel>? players,
    bool? confirmed
  }) : super(
    type: type
  );

  factory LineUpModel.fromJson(Map<String, dynamic> json){

    List<PlayerModel>? playersList;

    if(json.containsKey('players') && (json['players'] as List<dynamic>).isNotEmpty){

      playersList = [];

      for (var player in json['players'] as List<dynamic>) {
        Map<String, dynamic> playerMap = {
          'player': player['player'],
          'substitute': player['substitute']
        };

        playersList.add(PlayerModel.fromJson(playerMap));
      }
    }

    LineUpModel lineUp = LineUpModel(
      type: json.containsKey(LineUpType.away.type) ? LineUpType.away
          : LineUpType.home,
      goalKeeperColor: EventColorModel.fromJson(json['goalkeeperColor']),
      playerColor: EventColorModel.fromJson(json['playerColor']),
      players: playersList
    );

    return lineUp;
  }

}