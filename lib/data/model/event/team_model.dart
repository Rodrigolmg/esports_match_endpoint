part of model;


class TeamModel extends TeamEntity {

  TeamModel({
    required int id,
    CountryModel? country,
    String? fullName,
    String? name,
    String? nameCode,
    bool? national,
    String? shortName,
    String? slug,
    SportModel? sport,
    List<TeamModel>? subTeams,
    Map<String, String>? teamColors,
    int? type,
    int? userCount
  }) : super(
    id: id,
    country: country,
    fullName: fullName,
    name: name,
    nameCode: nameCode,
    national: national,
    shortName: shortName,
    slug: slug,
    sport: sport,
    subTeams: subTeams,
    teamColors: teamColors,
    type: type,
    userCount: userCount
  );

  factory TeamModel.fromJson(Map<String, dynamic> json){

    List<TeamModel>? subTeams;

    if((json['subTeams'] as List).isNotEmpty){
      subTeams = [];
      for(dynamic subTeam in (json['subTeams'] as List<dynamic>)) {
        subTeams.add(TeamModel.fromJson(subTeam));
      }
    }

    TeamModel team = TeamModel(
      id: json['id'],
      country: CountryModel.fromJson(json['country']),
      fullName: json['fullName'],
      name: json['name'],
      nameCode: json['nameCode'],
      national: json['national'],
      shortName: json['shortName'],
      slug: json['slug'],
      sport: json['sport'],
      subTeams: subTeams,
      teamColors: json['teamColors'],
      type: json['type'],
      userCount: json['userCount']
    );

    return team;
  }

}