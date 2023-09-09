part of model;

class H2hDuelModel extends H2hDuelEntity {

  H2hDuelModel({
    dynamic managerDuel,
    TeamDuelModel? teamDuel
  }) : super(
    managerDuel: managerDuel,
    teamDuel: teamDuel
  );

  factory H2hDuelModel.fromJson(Map<String, dynamic> json) {

    H2hDuelModel h2hDuel = H2hDuelModel(
      managerDuel: json['managerDuel'],
      teamDuel: TeamDuelModel.fromJson(json['teamDuel'])
    );

    return h2hDuel;
  }
}