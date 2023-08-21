part of datasource;

abstract class EventStreakLocalDataSource {
  Future<EventStreakModel?> getLastEventStreak();
  Future<void> cacheEventStreak(EventStreakModel eventStreakModel);
}

class EventStreakLocalDataSourceImpl implements EventStreakLocalDataSource {

  @override
  Future<void> cacheEventStreak(EventStreakModel eventStreakModel) async {

    Box eventStreakBox = Hive.box(DataSourceBoxName.eventStreakName);

    if(!eventStreakBox.isOpen){
      eventStreakBox = await Hive.openBox(DataSourceBoxName.eventStreakName);
    }

    eventStreakBox.put('type', eventStreakModel.type);
    eventStreakBox.put('name', eventStreakModel.name);
    eventStreakBox.put('team', eventStreakModel.team);

    if(eventStreakModel.continued != null) eventStreakBox.put('type', eventStreakModel.continued);
    if(eventStreakModel.value != null) eventStreakBox.put('type', eventStreakModel.value);
  }

  @override
  Future<EventStreakModel?> getLastEventStreak() async {
    Box eventStreakBox = Hive.box(DataSourceBoxName.eventStreakName);

    if(!eventStreakBox.isOpen){
      eventStreakBox = await Hive.openBox(DataSourceBoxName.eventStreakName);
    }

    int lastBoxIndex = eventStreakBox.length - 1;
    EventStreakModel? lastEventStreak = eventStreakBox.getAt(lastBoxIndex);
    return Future.value(lastEventStreak);
  }

}