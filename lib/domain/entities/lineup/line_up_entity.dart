part of entity;

// part 'line_up_entity.g.dart';
// import 'package:esports_match_endpoint/domain/entities/enums/line_up_type_enum.dart';
// import 'package:esports_match_endpoint/domain/entities/lineup/event_color_entity.dart';
// import 'package:esports_match_endpoint/domain/entities/lineup/player_entity.dart';
// import 'package:hive/hive.dart';

@HiveType(typeId: 9)
class LineUpEntity extends HiveObject{

  @HiveField(0)
  final LineUpType? type;

  @HiveField(1)
  final EventColorEntity? goalKeeperColor;

  @HiveField(2)
  final EventColorEntity? playerColor;

  @HiveField(3)
  final List<PlayerEntity>? players;

  @HiveField(4)
  final bool? confirmed;

  LineUpEntity({
    this.type,
    this.goalKeeperColor,
    this.playerColor,
    this.players,
    this.confirmed
  });
}