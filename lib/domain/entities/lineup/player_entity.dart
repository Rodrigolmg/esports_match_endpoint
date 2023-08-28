part of entity;

// import 'package:esports_match_endpoint/domain/entities/entity.dart';
// import 'package:hive/hive.dart';

@HiveType(typeId: 12)
class PlayerEntity extends HiveObject{

  @HiveField(0)
  final int id;

  @HiveField(1)
  final CountryEntity? country;

  @HiveField(2)
  final int? dateOfBirthTimestamp;

  @HiveField(3)
  final String? firstName;

  @HiveField(4)
  final String? lastName;

  @HiveField(5)
  final String? marketValueCurrency;

  @HiveField(6)
  final String? name;

  @HiveField(7)
  final String? shortName;

  @HiveField(8)
  final String? slug;

  @HiveField(9)
  final int? userCount;

  PlayerEntity({
    required this.id,
    this.country,
    this.dateOfBirthTimestamp,
    this.firstName,
    this.lastName,
    this.marketValueCurrency,
    this.name,
    this.shortName,
    this.slug,
    this.userCount,
  });

}