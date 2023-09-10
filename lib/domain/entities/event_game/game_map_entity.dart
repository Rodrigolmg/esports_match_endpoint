part of entity;

@HiveType(typeId: 18)
class GameMapEntity extends HiveObject{

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? name;

  GameMapEntity({
    required this.id,
    this.name,
  });
}