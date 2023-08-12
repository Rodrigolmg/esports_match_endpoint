import 'package:esports_match_endpoint/domain/entities/event_streak_entity.dart';


class EventStreakModel extends EventStreakEntity{

  const EventStreakModel({
    required super.type, required super.name, required super.team
  });

  factory EventStreakModel.fromJson(Map<String, dynamic> json){
    EventStreakModel eventStreakModel = EventStreakModel(
      type: json[],
      name: name,
      team: team
    )
    return
  }

}