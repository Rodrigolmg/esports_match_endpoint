part of datasource;

abstract class EventLocalDataSource {
  Future<EventModel?> getLastEvent();
  Future<void> cacheEvent(EventModel event);
}

class EventLocalDataSourceImpl implements EventLocalDataSource {

  @override
  Future<void> cacheEvent(EventModel event) {
    // TODO: implement cacheEvent
    throw UnimplementedError();
  }

  @override
  Future<EventModel?> getLastEvent() {
    // TODO: implement getLastEvent
    throw UnimplementedError();
  }


}