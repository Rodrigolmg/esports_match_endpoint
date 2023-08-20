import 'package:esports_match_endpoint/data/model/event_streak_model.dart';
import 'package:hive/hive.dart';

abstract class EventStreakLocalDataSource {
  Future<EventStreakModel?> getLastEventStreak(String boxName);
  Future<void> cacheEventStreak(EventStreakModel eventStreakModel);
}

class EventStreakLocalDataSourceImpl implements EventStreakLocalDataSource {

  @override
  Future<void> cacheEventStreak(EventStreakModel eventStreakModel) {
    // TODO: implement cacheEventStreak
    throw UnimplementedError();
  }

  @override
  Future<EventStreakModel?> getLastEventStreak(String boxName) async {
    await Hive.openBox(boxName);
    final eventStreakBox = Hive.box<EventStreakModel>(boxName);

    int lastBoxIndex = eventStreakBox.length - 1;
    EventStreakModel? lastEventStreak = eventStreakBox.getAt(lastBoxIndex);
    await eventStreakBox.close();
    await Hive.close();
    return Future.value(lastEventStreak);
  }

}