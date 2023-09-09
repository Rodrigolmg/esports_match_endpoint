
import 'package:hive/hive.dart';

@HiveType(typeId: 14)
class TeamDuelEntity extends HiveObject {

  final int? awayWins;
  final int? draws;
  final int? homeWins;

  TeamDuelEntity({
    this.awayWins,
    this.draws,
    this.homeWins,
  });
}