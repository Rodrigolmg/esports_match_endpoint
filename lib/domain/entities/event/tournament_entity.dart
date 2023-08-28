part of entity;

@HiveType(typeId: 5)
class TournamentEntity extends HiveObject{

  @HiveField(0)
  final int id;

  @HiveField(1)
  final int? competitionType;

  @HiveField(2)
  final CategoryEntity? category;

  @HiveField(3)
  final String? name;

  @HiveField(4)
  final int? priority;

  @HiveField(5)
  final String? slug;

  @HiveField(6)
  final SportEntity? sport;

  TournamentEntity({
    this.category,
    this.competitionType,
    required this.id,
    this.name,
    this.priority,
    this.slug,
    this.sport
  });
}

