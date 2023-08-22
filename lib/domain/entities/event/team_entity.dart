import 'package:esports_match_endpoint/domain/entities/event/country_entity.dart';
import 'package:esports_match_endpoint/domain/entities/event/sport_entity.dart';

class TeamEntity {
  final CountryEntity? country;
  final String? fullName;
  final int id;
  final String? name;
  final String? nameCode;
  final bool? national;
  final String? shortName;
  final String? slug;
  final SportEntity? sport;
  final List<TeamEntity>? subTeams;
  final Map<String, String>? teamColors;
  final int? type;
  final int? userCount;

  const TeamEntity({
    this.country,
    this.fullName,
    required this.id,
    this.name,
    this.nameCode,
    this.national,
    this.shortName,
    this.slug,
    this.sport,
    this.subTeams,
    this.teamColors,
    this.type,
    this.userCount,
  });
}