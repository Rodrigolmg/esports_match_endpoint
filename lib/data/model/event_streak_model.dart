import 'package:esports_match_endpoint/domain/entities/enums/event_streak_type_enum.dart';
import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';


class EventStreakModel extends EventStreakEntity{

  const EventStreakModel({
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
    return EventStreakModel(
        type: json['type'],
        name: json['name'],
        team: json['team'],
        value: json['value'],
        continued: json['continued']
    );
  }

}