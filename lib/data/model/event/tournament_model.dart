part of model;

class TournamentModel extends TournamentEntity {

  TournamentModel({
    required int id,
    CategoryModel? category,
    int? competitionType,
    String? name,
    int? priority,
    String? slug,
    SportModel? sport
  }) : super(
    id: id,
    category: category,
    competitionType: competitionType,
    name: name,
    priority: priority,
    slug: slug,
    sport: sport
  );

  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    TournamentModel tournament = TournamentModel(
      id: json['id'],
      category: CategoryModel.fromJson(json['category']),
      competitionType: json['competitionType'],
      name: json['name'],
      priority: json['priority'],
      slug: json['slug'],
      sport: SportModel.fromJson(json['sport'])
    );
    return tournament;
  }

}