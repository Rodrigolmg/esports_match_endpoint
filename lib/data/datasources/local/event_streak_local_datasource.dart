import 'package:esports_match_endpoint/data/model/event_streak_model.dart';

abstract class EventStreakLocalDataSource {
  Future<EventStreakModel> getLastEventStreak();
  Future<void> cacheEventStreak(EventStreakModel eventStreakModel);
}

class EventStreakLocalDataSourceImpl implements EventStreakLocalDataSource {

  @override
  Future<void> cacheEventStreak(EventStreakModel eventStreakModel) {
    // TODO: implement cacheEventStreak
    throw UnimplementedError();
  }

  @override
  Future<EventStreakModel> getLastEventStreak() {
    // TODO: implement getLastEventStreak
    throw UnimplementedError();
  }

}