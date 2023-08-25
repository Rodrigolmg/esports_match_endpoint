part of entity;

@HiveType(typeId: 6)
class CountryEntity extends HiveObject{

  @HiveField(0)
  final String? alpha2;

  @HiveField(1)
  final String? name;

  CountryEntity({
    this.alpha2,
    this.name,
  });
}