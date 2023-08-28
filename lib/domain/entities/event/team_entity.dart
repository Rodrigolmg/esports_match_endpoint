part of entity;

@HiveType(typeId: 3)
class TeamEntity extends HiveObject{

  @HiveField(0)
  final int id;

  @HiveField(1)
  final CountryEntity? country;

  @HiveField(2)
  final String? fullName;

  @HiveField(3)
  final String? name;

  @HiveField(4)
  final String? nameCode;

  @HiveField(5)
  final bool? national;

  @HiveField(6)
  final String? shortName;

  @HiveField(7)
  final String? slug;

  @HiveField(8)
  final SportEntity? sport;

  @HiveField(9)
  final List<TeamEntity>? subTeams;

  @HiveField(10)
  final Map<String, String>? teamColors;

  @HiveField(11)
  final int? type;

  @HiveField(12)
  final int? userCount;

  TeamEntity({
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