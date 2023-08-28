part of model;

class EventStreakModel extends EventStreakEntity {

  EventStreakModel({
    required EventStreakType type,
    required String? name,
    required String? team,
    bool? continued,
    String? value
  }) : super(
    type: type,
    name: name,
    team: team,
    continued: continued,
    value: value
  );

  factory EventStreakModel.fromJson(Map<String, dynamic> json){

    EventStreakType type = json['type'] == EventStreakType.general.type ?
      EventStreakType.general : EventStreakType.h2h;

    return EventStreakModel(
        type: type,
        name: json['name'],
        team: json['team'],
        value: json['value'],
        continued: json['continued']
    );
  }

}