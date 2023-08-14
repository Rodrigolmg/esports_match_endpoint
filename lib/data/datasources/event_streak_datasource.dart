import 'package:esports_match_endpoint/data/model/event_streak_model.dart';

abstract class EventStreakDataSource {
  Future<EventStreakModel> getEventStreaks(int? id);
}