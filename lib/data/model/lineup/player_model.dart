part of model;

class PlayerModel extends PlayerEntity {

  PlayerModel({
    required int id,
    CountryModel? country,
    int? dateOfBirthTimestamp,
    String? firstName,
    String? lastName,
    String? marketValueCurrency,
    String? name,
    String? shortName,
    String? slug,
    int? userCount,
    bool? substitute
  }) : super(
    id: id,
    country: country,
    dateOfBirthTimestamp: dateOfBirthTimestamp,
    firstName: firstName,
    lastName: lastName,
    marketValueCurrency: marketValueCurrency,
    name: name,
    shortName: shortName,
    slug: slug,
    userCount: userCount,
    substitute: substitute
  );

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    PlayerModel playerFromJson = PlayerModel(
      id: json['player']['id'],
      country: CountryModel.fromJson(json['player']['country']),
      dateOfBirthTimestamp: json['player']['dateOfBirthTimestamp'],
      firstName: json['player']['firstName'],
      lastName: json['player']['lastName'],
      marketValueCurrency: json['player']['marketValueCurrency'],
      name: json['player']['name'],
      shortName: json['player']['shortName'],
      slug: json['player']['slug'],
      userCount: json['player']['userCount'],
      substitute: json['substitute']
    );

    return playerFromJson;
  }

}