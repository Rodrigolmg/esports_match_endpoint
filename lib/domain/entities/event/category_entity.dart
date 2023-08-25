part of entity;

@HiveType(typeId: 8)
class CategoryEntity extends HiveObject{

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? flag;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? slug;

  CategoryEntity({
    this.flag,
    required this.id,
    this.name,
    this.slug,
  });
}