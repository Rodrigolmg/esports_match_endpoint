part of datasource;

abstract class EventGameLocalDataSource {
  Future<List<EventGameEntity>> getLastEventGames();
  Future<void> cacheEventGames(List<EventGameEntity> games);
}

class EventGameLocalDataSourceImpl implements EventGameLocalDataSource {
  @override
  Future<void> cacheEventGames(List<EventGameEntity> games) async {
    Box eventGameBox = Hive.box(DataSourceBoxName.eventGameName);

    if(!eventGameBox.isOpen){
      eventGameBox = await Hive.openBox(DataSourceBoxName.eventGameName);
    }

    eventGameBox.add(games);
  }

  @override
  Future<List<EventGameEntity>> getLastEventGames() async {
    Box eventGameBox = Hive.box(DataSourceBoxName.eventStreakName);

    if(!eventGameBox.isOpen){
      eventGameBox = await Hive.openBox(DataSourceBoxName.eventStreakName);
    }

    int lastBoxIndex = eventGameBox.length - 1;
    List<EventGameModel>? lastGames = eventGameBox.getAt(lastBoxIndex);
    return Future.value(lastGames);
  }

}