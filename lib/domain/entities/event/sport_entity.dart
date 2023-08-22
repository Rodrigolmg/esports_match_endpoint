class SportEntity {
  final int id;
  final String? name;
  final String? slug;

  const SportEntity({
    required this.id,
    this.name,
    this.slug,
  });
}