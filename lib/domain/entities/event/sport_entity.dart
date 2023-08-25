part of entity;

@HiveType(typeId: 7)
class SportEntity extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? slug;

  SportEntity({
    required this.id,
    this.name,
    this.slug,
  });
}