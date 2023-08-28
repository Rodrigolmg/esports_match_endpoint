part of entity;

// part 'line_up_entity.g.dart';
// import 'package:esports_match_endpoint/domain/entities/enums/line_up_type_enum.dart';
// import 'package:esports_match_endpoint/domain/entities/lineup/event_colors_entity.dart';
// import 'package:esports_match_endpoint/domain/entities/lineup/player_entity.dart';
// import 'package:hive/hive.dart';

@HiveType(typeId: 9)
class LineUpEntity extends HiveObject{

  @HiveField(0)
  final LineUpType type;

  @HiveField(1)
  final EventColorsEntity? goalKeeperColor;

  @HiveField(2)
  final EventColorsEntity? playerColor;

  @HiveField(3)
  final List<PlayerEntity>? players;

  @HiveField(4)
  final bool? confirmed;

  LineUpEntity({
    required this.type,
    this.goalKeeperColor,
    this.playerColor,
    this.players,
    this.confirmed
  });
}