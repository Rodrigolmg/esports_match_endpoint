part of datasource;

abstract class EventGameLocalDataSource {
  Future<List<EventGameEntity>> getLastEventGames();
  Future<void> cacheEventGames(List<EventGameEntity> games);
}

class EventGameLocalDataSourceImpl implements EventGameLocalDataSource {
  @override
  Future<void> cacheEventGames(List<EventGameEntity> games) {
    // TODO: implement cacheEventGames
    throw UnimplementedError();
  }

  @override
  Future<List<EventGameEntity>> getLastEventGames() {
    // TODO: implement getLastEventGames
    throw UnimplementedError();
  }

}