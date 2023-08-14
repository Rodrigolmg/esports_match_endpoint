import 'package:esports_match_endpoint/data/model/event_streak_model.dart';

abstract class EventStreakLocalDataSource {
  Future<EventStreakModel> getLastEventStreak();
  Future<void> cacheEventStreak(EventStreakModel eventStreakModel);
}