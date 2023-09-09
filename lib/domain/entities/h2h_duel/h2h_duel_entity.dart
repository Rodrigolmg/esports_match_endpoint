// part of entity;

import 'package:esports_match_endpoint/domain/entities/h2h_duel/team_duel_entity.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 13)
class H2hDuelEntity extends HiveObject {

  @HiveField(0)
  dynamic managerDuel;

  @HiveField(1)
  TeamDuelEntity? teamDuel;

  H2hDuelEntity({
    this.managerDuel,
    this.teamDuel,
  });
}