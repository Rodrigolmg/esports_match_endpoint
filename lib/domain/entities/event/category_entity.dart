class CategoryEntity {
  final String? flag;
  final int id;
  final String? name;
  final String? slug;

  const CategoryEntity({
    this.flag,
    required this.id,
    this.name,
    this.slug,
  });
}